package rpc_impl

import (
	"context"
	"errors"
	"github.com/shopspring/decimal"
	"restaurant_backend/database"
	"restaurant_backend/logger"
	myutils "restaurant_backend/my_utils"
	"restaurant_backend/po"
	"restaurant_backend/restaurant_backend/rpc"
	"strconv"
)

type EmployeeServer struct {
	restaurant_rpc.UnimplementedEmployeeServiceServer
}

func (s *EmployeeServer) GetEmployeeList(ctx context.Context, req *restaurant_rpc.EmployeeListReq) (*restaurant_rpc.EmployeeListResp, error) {
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
			CreatedAt: strconv.FormatInt(employee.CreatedAt.Unix(), 10),
			UpdatedAt: strconv.FormatInt(employee.UpdatedAt.Unix(), 10),
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
