package rpc_impl

import (
	"context"
	"errors"
	"fmt"
	"github.com/shopspring/decimal"
	"google.golang.org/protobuf/types/known/emptypb"
	"gorm.io/gorm"
	"restaurant_backend/database"
	myutils "restaurant_backend/my_utils"
	"restaurant_backend/po"
	restaurant_rpc "restaurant_backend/restaurant_backend/rpc"
	"time"
)

type CostServer struct {
	restaurant_rpc.UnimplementedCostServiceServer
}

func (s *CostServer) GetAllCost(ctx context.Context, req *restaurant_rpc.GetAllCostReq) (*restaurant_rpc.GetAllCostResp, error) {
	token, ok := myutils.ExtractUserInfoFromContext(ctx);
	if !ok {
		return nil, errors.New("无法获取用户信息")
	}
	if token.Role != restaurant_rpc.LoginRole_LOGIN_ROLE_EMPLOYEE {
		return nil, errors.New("权限不足")
	}
	costType := req.CostType
	var poCostList []po.Cost
	if costType <= 0 { // 获取所有成本
		if err := database.DB().Model(&po.Cost{}).Find(&poCostList).Error; err != nil {
			return nil, errors.New("服务器错误")
		}
	} else { // 获取特定成本
		if err := database.DB().Model(&po.Cost{}).Where("cost_type = ?", costType).Find(&poCostList).Error; err != nil {
			return nil, errors.New("服务器错误")
		}
	}

	var pbCostList []*restaurant_rpc.CostInfo
	for _, poCost := range poCostList {
		pbCostList = append(pbCostList, &restaurant_rpc.CostInfo{
			CostId: uint32(poCost.ID),
			Value: poCost.Value.StringFixed(2),
			Description: poCost.Description,
			CostType: poCost.CostType,
			CreatedAt: poCost.CreatedAt.Unix(),
		})
	}
	return &restaurant_rpc.GetAllCostResp{
		CostInfoList: pbCostList,
	}, nil
}

func (s *CostServer) DeleteCosts(ctx context.Context, req *restaurant_rpc.DeleteCostsReq) (*emptypb.Empty, error) {
	ids := req.CostIdList
	if len(ids) == 0 { // 没有提供id, 无需删除
		return &emptypb.Empty{}, nil
	}
	tx := database.DB().Begin()
	defer func() {
		if err := recover(); err != nil {
			tx.Rollback()
		}
	}()
	// 检查传入的id是否存在
	for _, id := range ids {
		if err := tx.Model(&po.Cost{}).Where("id = ?", id).First(&po.Cost{}).Error; err != nil {
			if errors.Is(err, gorm.ErrRecordNotFound) {
				tx.Rollback()
				return nil, errors.New(fmt.Sprintf("id: %d 不存在", id))
			}
			tx.Rollback()
			return nil, errors.New("服务器错误")
		}
	}
	// 执行删除
	if err := tx.Model(&po.Cost{}).Where("id in ?", ids).Unscoped().Delete(&po.Cost{}).Error; err != nil {
		tx.Rollback()
		return nil, errors.New("服务器错误")
	}
	if err := tx.Commit().Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	return &emptypb.Empty{}, nil
}

func (s *CostServer) GetCostChartData(ctx context.Context, req *emptypb.Empty) (*restaurant_rpc.GetCostChartDataResp, error) {
	var poCostList []po.Cost
	// 获取所有成本
	if err := database.DB().Model(&po.Cost{}).Find(&poCostList).Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	// 分类
	var typedCostMap map[restaurant_rpc.CostType][]decimal.Decimal = make(map[restaurant_rpc.CostType][]decimal.Decimal)
	var total decimal.Decimal // 同时统计总金额
	for _, v := range poCostList {
		if _, ok := typedCostMap[v.CostType]; !ok {
			typedCostMap[v.CostType] = []decimal.Decimal{}
		}
		typedCostMap[v.CostType] = append(typedCostMap[v.CostType], v.Value)
		total = total.Add(v.Value)
	}
	for _, v := range poCostList {
		fmt.Println(v.Value)
	}
	var distributionDataList []*restaurant_rpc.CostDistribution
	for key, value := range typedCostMap {
		typedTotalCost := decimal.NewFromInt(0)
		for _, cost := range value {
			typedTotalCost = typedTotalCost.Add(cost)
		}
		distributionDataList = append(distributionDataList, &restaurant_rpc.CostDistribution{
			Desc: myutils.GetCostTypeDesc(key),
			Total: typedTotalCost.StringFixed(2),
			Value: typedTotalCost.Div(total).StringFixed(2), // 计算占比
			CostType: key,
		})
	}
	/// 统计员工薪资top5(排除管理员)
	var top5SalaryEmployeeList []po.Employee
	if err := database.DB().
		Model(&po.Employee{}).
		Where("role_type = ? OR role_type = ?", restaurant_rpc.EmployeeRole_ROLE_NORMAL, restaurant_rpc.EmployeeRole_ROLE_MANAGER).
		Order("CAST(salary AS NUMERIC) DESC"). // 根据工资降序
		Limit(5). // 只取前5个
		Find(&top5SalaryEmployeeList).Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	var salaryRankList []*restaurant_rpc.SalaryRankData_SalaryRankItem
	for _, employee := range top5SalaryEmployeeList {
		salaryRankList = append(salaryRankList, &restaurant_rpc.SalaryRankData_SalaryRankItem{
			EmployeeId: uint32(employee.ID),
			Salary: employee.Salary.StringFixed(2),
			Name: employee.Name,
			Phone: employee.Phone,
		})
	}
	return &restaurant_rpc.GetCostChartDataResp{
		CostChartData: &restaurant_rpc.CostChartData{
			CostDistribution: &restaurant_rpc.CostDistributionData{
				CostDistributionList: distributionDataList,
			},
			SalaryRank: &restaurant_rpc.SalaryRankData{
				SalaryRankList: salaryRankList,
			},
		},
	}, nil
}

func (s *CostServer) AddCostItem(ctx context.Context, req *restaurant_rpc.AddCostItemReq) (*emptypb.Empty, error) {
	if len(req.Desc) == 0 {
		return nil, errors.New("成本项描述不能为空")
	}
 	value, err := decimal.NewFromString(req.Value)
	if err != nil {
		return nil, errors.New("请输入正确的数字")
	}
	var poCost = po.Cost{
		Model: gorm.Model{
			CreatedAt: time.Unix(req.CreatedAt, 0),
		},
		CostType: req.CostType,
		Value: value,
		Description: req.Desc,
	}
	if err := database.DB().Model(&po.Cost{}).Create(&poCost).Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	return &emptypb.Empty{}, nil
}

func (s *CostServer) GetMonthlyCostTrend(ctx context.Context, req *restaurant_rpc.GetMonthlyCostTrendReq) (*restaurant_rpc.GetMonthlyCostTrendResp, error) {
	// 获取今年年份
	year := req.Year
	if year <= 0 {
		return nil, errors.New("请提供正确的年份")
	}
	type Result struct {
		Month uint32
		Value decimal.Decimal
	}
	var costResults []Result
	// 查询本年份的每月所有成本
	if err := database.DB().Model(&po.Cost{}).
		Where("EXTRACT(YEAR FROM created_at) = ?", year).
		Select("EXTRACT(MONTH FROM created_at)::int as month, SUM(value::numeric) as value").
		Group("EXTRACT(MONTH FROM created_at)::int").
		Order("month asc"). // 升序排序
		Scan(&costResults).Error; err != nil {
			return nil, errors.New("服务器错误")
	}
	var pbMonthlyCostList []*restaurant_rpc.MonthlyCost
	for _, result := range costResults {
		pbMonthlyCostList = append(pbMonthlyCostList, &restaurant_rpc.MonthlyCost{
			Year: year,
			Month: result.Month,
			Value: result.Value.StringFixed(2),
		})
	}
	// 查询本年份的每月营收
	var incomeResults []Result
	if err := database.DB().Model(&po.Order{}).
		Where("EXTRACT(YEAR FROM created_at) = ?", year).
		Select("EXTRACT(MONTH FROM created_at)::int as month, SUM(total::numeric) as value").
		Group("EXTRACT(MONTH FROM created_at)::int").
		Order("month asc"). // 升序排序
		Scan(&incomeResults).Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	var pbMonthlyIncomeList []*restaurant_rpc.MonthlyIncome
	for _, income := range incomeResults {
		pbMonthlyIncomeList = append(pbMonthlyIncomeList, &restaurant_rpc.MonthlyIncome{
			Month: income.Month,
			Year: year,
			Value: income.Value.StringFixed(2),
		})
	}
	trend := &restaurant_rpc.MonthlyCostAndIncomeList{
		MonthlyCostList: pbMonthlyCostList,
		MonthlyIncomeList: pbMonthlyIncomeList,
	}
	return &restaurant_rpc.GetMonthlyCostTrendResp{
		MonthlyCostTrend: trend,
	}, nil
}
