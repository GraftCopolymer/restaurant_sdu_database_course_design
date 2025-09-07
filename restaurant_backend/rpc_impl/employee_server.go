package rpc_impl

import (
	"context"
	"errors"
	"github.com/shopspring/decimal"
	"google.golang.org/protobuf/types/known/emptypb"
	"gorm.io/gorm"
	"restaurant_backend/database"
	"restaurant_backend/logger"
	myutils "restaurant_backend/my_utils"
	"restaurant_backend/po"
	"restaurant_backend/restaurant_backend/rpc"
	"time"
)

type EmployeeServer struct {
	restaurant_rpc.UnimplementedEmployeeServiceServer
}

func (s *EmployeeServer) GetEmployeeList(ctx context.Context, req *restaurant_rpc.EmployeeListReq) (*restaurant_rpc.EmployeeListResp, error) {
	// 提取当前用户的信息
	token, ok := myutils.ExtractUserInfoFromContext(ctx)
	if !ok {
		return nil, errors.New("获取用户信息失败")
	}

	// 管理员可以获取全部雇员的信息
	if token.Role == restaurant_rpc.LoginRole_LOGIN_ROLE_EMPLOYEE && token.EmployeeRole == restaurant_rpc.EmployeeRole_ROLE_ADMIN {
		// 需分页查询
		keywords := req.Keywords
		pageInfo := req.PageInfo
		// 提取分页信息
		page, pageSize, err := myutils.ExtractAndProcessPagination(pageInfo)
		if err != nil {
			logger.Logger().Error("Failed to extract pagination info %v", err)
			return nil, errors.New("服务器错误")
		}
		var result []po.Employee
		err = database.DB().
			Where("name ILIKE ? OR phone ILIKE ?", "%"+keywords+"%", "%"+keywords+"%").
			Scopes(database.Paginate(page, pageSize)).Find(&result).Error
		if err != nil {
			return nil, errors.New("服务器错误")
		}
		var count int64
		err = database.DB().Model(&po.Employee{}).Count(&count).Error
		if err != nil {
			return nil, errors.New("服务器错误")
		}
		var employeeList []*restaurant_rpc.EmployeeInfo
		for _, employee := range result {
			employeeList = append(employeeList, &restaurant_rpc.EmployeeInfo{
				Id:        uint32(employee.ID),
				Name:      employee.Name,
				Phone:     employee.Phone,
				Role:      employee.RoleType,
				Salary:    employee.Salary.String(),
				CreatedAt: employee.CreatedAt.Unix(),
				UpdatedAt: employee.UpdatedAt.Unix(),
			})
		}
		respPageInfo := &restaurant_rpc.PageInfo{
			Page:     uint32(page),
			PageSize: uint32(pageSize),
			Total: uint64(count),
		}
		resp := &restaurant_rpc.EmployeeListResp{
			EmployeeList: employeeList,
			PageInfo: respPageInfo,
		}
		return resp, nil
	} else if token.Role == restaurant_rpc.LoginRole_LOGIN_ROLE_EMPLOYEE && token.EmployeeRole == restaurant_rpc.EmployeeRole_ROLE_MANAGER {
		// 非管理员, 但是是经理, 仅可查看自己管理的雇员
		// 需分页查询
		keywords := req.Keywords
		pageInfo := req.PageInfo
		// 提取分页信息
		page, pageSize, err := myutils.ExtractAndProcessPagination(pageInfo)
		if err != nil {
			logger.Logger().Error("Failed to extract pagination info %v", err)
			return nil, errors.New("服务器错误")
		}
		var result []po.Employee
		err = database.DB().
			Where("manager_id IS NOT NULL AND manager_id = ?", token.UserID).
			Where("name ILIKE ? OR phone ILIKE ?", "%"+keywords+"%", "%"+keywords+"%").
			Scopes(database.Paginate(page, pageSize)).Find(&result).Error
		if err != nil {
			return nil, errors.New("服务器错误")
		}
		var count int64
		err = database.DB().Model(&po.Employee{}).Count(&count).Error
		if err != nil {
			return nil, errors.New("服务器错误")
		}
		var employeeList []*restaurant_rpc.EmployeeInfo
		for _, employee := range result {
			employeeList = append(employeeList, &restaurant_rpc.EmployeeInfo{
				Id:        uint32(employee.ID),
				Name:      employee.Name,
				Phone:     employee.Phone,
				Role:      employee.RoleType,
				Salary:    employee.Salary.String(),
				CreatedAt: employee.CreatedAt.Unix(),
				UpdatedAt: employee.UpdatedAt.Unix(),
			})
		}
		respPageInfo := &restaurant_rpc.PageInfo{
			Page:     uint32(page),
			PageSize: uint32(pageSize),
			Total: uint64(count),
		}
		resp := &restaurant_rpc.EmployeeListResp{
			EmployeeList: employeeList,
			PageInfo: respPageInfo,
		}
		return resp, nil
	} else {
		return nil, errors.New("权限不足")
	}
}

func (s *EmployeeServer) AddEmployee(ctx context.Context, req *restaurant_rpc.AddEmployeeReq) (*restaurant_rpc.AddEmployeeResp, error) {
	// 检查员工是否已经存在
	if req.EmployeeName == "" || req.Phone == "" || req.Password == "" {
		return nil, errors.New("参数错误")
	}
	if req.Role == restaurant_rpc.EmployeeRole_ROLE_UNKNOWN {
		return nil, errors.New("请选择员工角色")
	}
	var exist bool
	err := database.DB().Model(&po.Employee{}).Where("phone = ?", req.Phone).Select("1").Scan(&exist).Error
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	if exist {
		return nil, errors.New("员工已存在")
	}
	hash, err := myutils.HashPassword(req.Password)
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	employee := po.Employee{
		Name: req.EmployeeName,
		Phone: req.Phone,
		Password: hash,
		Salary: decimal.NewFromInt(0),
		RoleType: req.Role,
	}
	err = database.DB().Create(&employee).Error
	if err != nil {
		return nil, errors.New("保存员工失败")
	}
	return &restaurant_rpc.AddEmployeeResp{
		Code: 0,
		Message: "添加员工成功",
	}, nil
}

func (s *EmployeeServer) GetEmployeeInfo(ctx context.Context, req *restaurant_rpc.GetEmployeeInfoReq) (*restaurant_rpc.GetEmployeeInfoResp, error) {
	employeeId := req.EmployeeId
	if employeeId <= 0 {
		return nil, errors.New("员工不存在")
	}
	var poEmployee po.Employee
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", employeeId).Preload("Manager").First(&poEmployee).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("员工不存在")
		}
		return nil, errors.New("服务器错误")
	}
	// 尝试获取该员工的直接上级
	var pbManager *restaurant_rpc.EmployeeInfo = nil
	if poEmployee.Manager != nil {
		manager := poEmployee.Manager
		pbManager = &restaurant_rpc.EmployeeInfo{
			Id: uint32(manager.ID),
			Name: manager.Name,
			Phone: manager.Phone,
			Role: manager.RoleType,
			Salary: manager.Salary.StringFixed(2),
			CreatedAt: manager.CreatedAt.Unix(),
			UpdatedAt: manager.UpdatedAt.Unix(),
			// 不加载经理的经理
		}
	}
	employeeInfo := &restaurant_rpc.EmployeeInfo{
		Id: uint32(poEmployee.ID),
		Name: poEmployee.Name,
		Phone: poEmployee.Phone,
		Role: poEmployee.RoleType,
		Salary: poEmployee.Salary.StringFixed(2),
		CreatedAt: poEmployee.CreatedAt.Unix(),
		UpdatedAt: poEmployee.UpdatedAt.Unix(),
		Manager: pbManager,
	}
	return &restaurant_rpc.GetEmployeeInfoResp{
		EmployeeInfo: employeeInfo,
	}, nil
}

func (s *EmployeeServer) UpdateEmployeeRole(ctx context.Context, req *restaurant_rpc.UpdateEmployeeRoleReq) (*emptypb.Empty, error) {
	employeeId := req.EmployeeId
	if employeeId <= 0 {
		return nil, errors.New("无效的员工信息")
	}
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", employeeId).First(&po.Employee{}).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("员工不存在")
		}
		return nil, errors.New("服务器错误")
	}
	// 更新雇员信息
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", employeeId).Update("role_type", req.NewRole).Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	return &emptypb.Empty{}, nil
}

func (s *EmployeeServer) UpdateEmployeePhone(ctx context.Context, req *restaurant_rpc.UpdateEmployeePhoneReq) (*emptypb.Empty, error) {
	phone := req.Phone
	if phone == "" {
		return nil, errors.New("电话号码不能为空")
	}
	employeeId := req.EmployeeId
	if employeeId <= 0 {
		return nil, errors.New("无效的员工信息")
	}
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", employeeId).First(&po.Employee{}).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("员工不存在")
		}
		return nil, errors.New("服务器错误")
	}
	// 检查该电话号码是否已存在
	var poEmployees []po.Employee
	if err := database.DB().Model(&po.Employee{}).Where("phone = ?", phone).Find(&poEmployees).Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	for _, poEmployee := range poEmployees {
		if poEmployee.ID != uint(employeeId) && poEmployee.Phone == phone {
			return nil, errors.New("该电话号码已被使用")
		}
	}
	// 更新雇员信息
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", employeeId).Update("phone", phone).Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	return &emptypb.Empty{}, nil
}

func (s *EmployeeServer) UpdateEmployeeSalary(ctx context.Context, req *restaurant_rpc.UpdateEmployeeSalaryReq) (*emptypb.Empty, error) {
	employeeId := req.EmployeeId
	if employeeId <= 0 {
		return nil, errors.New("无效的员工信息")
	}
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", employeeId).First(&po.Employee{}).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("员工不存在")
		}
		return nil, errors.New("服务器错误")
	}
	// 检查薪资数据是否合法
	if _, err := decimal.NewFromString(req.NewSalary); err != nil {
		return nil, errors.New("薪资数据不合法")
	}
	// 更新雇员信息
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", employeeId).Update("salary", req.NewSalary).Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	return &emptypb.Empty{}, nil
}

func (s *EmployeeServer) GetAllManager(ctx context.Context, req *emptypb.Empty) (*restaurant_rpc.GetAllManagerResp, error) {
	token, ok := myutils.ExtractUserInfoFromContext(ctx);
	if !ok {
		return nil, errors.New("无法获取用户信息")
	}
	if token.Role != restaurant_rpc.LoginRole_LOGIN_ROLE_EMPLOYEE || token.EmployeeRole != restaurant_rpc.EmployeeRole_ROLE_ADMIN {
		return nil, errors.New("权限不足")
	}
	// 查询所有经理
	var poManagers []po.Employee
	if err := database.DB().Model(&po.Employee{}).Where("role_type = ?", restaurant_rpc.EmployeeRole_ROLE_MANAGER).Find(&poManagers).Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	var pbManagers []*restaurant_rpc.EmployeeInfo
	for _, poManager := range poManagers {
		pbManagers = append(pbManagers, &restaurant_rpc.EmployeeInfo{
			Id: uint32(poManager.ID),
			Name: poManager.Name,
			Phone: poManager.Phone,
			Role: poManager.RoleType,
			Salary: poManager.Salary.StringFixed(2),
			CreatedAt: poManager.CreatedAt.Unix(),
			UpdatedAt: poManager.UpdatedAt.Unix(),
		})
	}
	return &restaurant_rpc.GetAllManagerResp{
		ManagerList: pbManagers,
	}, nil
}

func (s *EmployeeServer) UpdateEmployeeManager(ctx context.Context, req *restaurant_rpc.UpdateManagerReq) (*emptypb.Empty, error) {
	employeeId := req.EmployeeId
	if employeeId <= 0 {
		return nil, errors.New("无效的员工信息")
	}
	managerId := req.NewManagerId
	if managerId <= 0 {
		return nil, errors.New("无效的经理信息")
	}
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", employeeId).First(&po.Employee{}).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("员工不存在")
		}
		return nil, errors.New("服务器错误")
	}
	var poManager po.Employee
	// 检查managerId对应的人员是否是经理角色
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", managerId).First(&poManager).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("该经理不存在")
		}
		return nil, errors.New("服务器错误")
	}
	if poManager.RoleType != restaurant_rpc.EmployeeRole_ROLE_MANAGER {
		return nil, errors.New("该雇员不是经理")
	}
	// 更新雇员信息
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", employeeId).Update("manager_id", managerId).Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	return &emptypb.Empty{}, nil
}

func (s *EmployeeServer) ClearEmployeeManager(ctx context.Context, req *restaurant_rpc.ClearEmployeeManagerReq) (*emptypb.Empty, error) {
	employeeId := req.EmployeeId
	if employeeId <= 0 {
		return nil, errors.New("无效的员工信息")
	}
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", employeeId).First(&po.Employee{}).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("员工不存在")
		}
		return nil, errors.New("服务器错误")
	}
	// 更新雇员信息
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", employeeId).Update("manager_id", nil).Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	return &emptypb.Empty{}, nil
}

func (s *EmployeeServer) DeleteEmployee(ctx context.Context, req *restaurant_rpc.DeleteEmployeeReq) (*emptypb.Empty, error) {
	employeeId := req.EmployeeId
	if employeeId <= 0 {
		return nil, errors.New("无效的员工信息")
	}
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", employeeId).First(&po.Employee{}).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("员工不存在")
		}
		return nil, errors.New("服务器错误")
	}
	// 删除雇员
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", employeeId).Unscoped().Delete(&po.Employee{}).Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	return &emptypb.Empty{}, nil
}

func (s *EmployeeServer) PaySalary(ctx context.Context, req *emptypb.Empty) (*restaurant_rpc.PaySalaryResp, error) {
	token, ok := myutils.ExtractUserInfoFromContext(ctx)
	if !ok {
		return nil, errors.New("获取用户信息失败")
	}
	if token.UserID <= 0 {
		return nil, errors.New("用户ID不合法")
	}
	// 检查角色
	if token.EmployeeRole != restaurant_rpc.EmployeeRole_ROLE_MANAGER {
		return nil, errors.New("只有经理角色支持发薪")
	}
	var poCurrentEmployee po.Employee
	if err := database.DB().Model(&po.Employee{}).Where("id = ?", token.UserID).First(&poCurrentEmployee).Error; err != nil {
		return nil, errors.New("系统错误")
	}
	/// 所有被本用户管理的人员
	var allManagedEmployeeList []po.Employee
	if err := database.DB().Model(&po.Employee{}).Where("manager_id = ?", token.UserID).Find(&allManagedEmployeeList).Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	// 计算工资总额
	var total decimal.Decimal
	for _, employee := range allManagedEmployeeList {
		total = total.Add(employee.Salary)
	}
	// 计入成本系统
	tx := database.DB().Begin()
	defer func() {
		if err := recover(); err != nil {
			tx.Rollback()
		}
	}()
	// 获取当前格式化后的日期
	dateString := time.Now().Format("2006年01月02日 15:04")
	var cost = po.Cost{
		CostType: restaurant_rpc.CostType_COST_TYPE_LABOR,
		Value: total,
		Description: dateString + " 工资发放",
	}
	if err := tx.Model(&po.Cost{}).Create(&cost).Error; err != nil {
		tx.Rollback()
		return nil, errors.New("服务器错误")
	}
	if err := tx.Commit().Error; err != nil {
		return nil, errors.New("服务器错误")
	}
	return &restaurant_rpc.PaySalaryResp{
		Total: total.StringFixed(2),
	}, nil
}
