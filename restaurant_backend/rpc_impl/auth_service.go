package rpc_impl

import (
	"context"
	"errors"
	"google.golang.org/protobuf/types/known/emptypb"
	"gorm.io/gorm"
	"log"
	"restaurant_backend/constants"
	"restaurant_backend/database"
	myutils "restaurant_backend/my_utils"
	"restaurant_backend/po"
	"restaurant_backend/restaurant_backend/rpc"
)

type AuthServer struct {
	restaurant_rpc.UnimplementedAuthServiceServer
}

func (s *AuthServer) Login(ctx context.Context, req *restaurant_rpc.LoginReq) (*restaurant_rpc.LoginResp, error) {
	log.Println("登录")
	role := req.Role
	if role == restaurant_rpc.LoginRole_LOGIN_ROLE_UNKNOWN {
		return nil, errors.New("错误, 未知的登录角色")
	}

	if role == restaurant_rpc.LoginRole_LOGIN_ROLE_CUSTOMER {
		customer := po.Customer{}
		// 执行用户登录逻辑
		err := database.DB().Model(&customer).Where("username = ? OR phone = ?", req.UsernameOrPhone, req.UsernameOrPhone).First(&customer).Error
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("用户名或密码错误")
		}
		if err != nil {
			return nil, errors.New("服务器错误")
		}

		// 生成 JWT
		accessToken, err := myutils.GenerateAccessJWT(customer.ID, restaurant_rpc.LoginRole_LOGIN_ROLE_CUSTOMER, nil)
		if err != nil {
			return nil, err
		}
		refreshToken, err := myutils.GenerateRefreshJWT(customer.ID, restaurant_rpc.LoginRole_LOGIN_ROLE_CUSTOMER, nil)
		if err != nil {
			return nil, err
		}

		return &restaurant_rpc.LoginResp{
			AccessToken: accessToken,
			RefreshToken: refreshToken,
			Role: restaurant_rpc.LoginRole_LOGIN_ROLE_CUSTOMER,
			Status: &restaurant_rpc.RespStatus{Code: 0, Message: "Login success"},
		}, nil
	} else if role == restaurant_rpc.LoginRole_LOGIN_ROLE_EMPLOYEE {
		// 执行员工登录逻辑
		employee := po.Employee{}
		err := database.DB().Where("phone = ?", req.UsernameOrPhone).First(&employee).Error
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return nil, errors.New("该员工不存在")
		}
		// 生成 JWT
		accessToken, err := myutils.GenerateAccessJWT(employee.ID, restaurant_rpc.LoginRole_LOGIN_ROLE_EMPLOYEE, &employee.RoleType)
		if err != nil {
			return nil, err
		}
		refreshToken, err := myutils.GenerateRefreshJWT(employee.ID, restaurant_rpc.LoginRole_LOGIN_ROLE_EMPLOYEE, &employee.RoleType)
		if err != nil {
			return nil, err
		}
		loginResp := &restaurant_rpc.LoginResp{
			AccessToken:  accessToken,
			RefreshToken: refreshToken,
			Role:         restaurant_rpc.LoginRole_LOGIN_ROLE_EMPLOYEE,
			EmployeeRole: employee.RoleType,
			Status:       &restaurant_rpc.RespStatus{Code: 0, Message: "Login success"},
			Phone: employee.Phone,
			Salary: employee.Salary.StringFixed(2),
			Username: employee.Name,
		}
		var managerId uint32
		if employee.ManagerID != nil {
			managerId = uint32(*employee.ManagerID)
			loginResp.ManagerId = managerId
		}
		return loginResp, nil
	}
	return nil, errors.New("未知登录角色, 拒绝登录")
}

func (s *AuthServer) Register(ctx context.Context, req *restaurant_rpc.RegisterReq) (*restaurant_rpc.RegisterResp, error) {
	username := req.Username
	phone := req.Phone
	password := req.Password
	repeatedPassword := req.RepeatedPassword

	switch {
	case username == "":
		return nil, errors.New("用户名不能为空")
	case phone == "":
		return nil, errors.New("电话号码不能为空")
	case password == "":
		return nil, errors.New("密码不能为空")
	case repeatedPassword == "":
		return nil, errors.New("请再次输入密码")
	case password != repeatedPassword:
		return nil, errors.New("两次输入的密码不一致")
	}

	// 检查用户名是否已存在
	var count int64
	err := database.DB().Model(&po.Customer{}).Where("username = ?", username).Count(&count).Error
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	if count > 0 {
		return nil, errors.New("用户名已存在")
	}

	// 检查手机号是否已被注册
	err = database.DB().Model(&po.Customer{}).Where("phone = ?", phone).Count(&count).Error
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	if count > 0 {
		return nil, errors.New("手机号已注册")
	}

	// 检查用户名是否等于他人的手机号（排除手机号=当前手机号）
	err = database.DB().
		Model(&po.Customer{}).
		Where("phone = ? AND phone != ?", username, phone).
		Count(&count).Error
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	if count > 0 {
		return nil, errors.New("用户名已存在")
	}

	// 密码加密
	hashedPassword, err := myutils.HashPassword(password)
	if err != nil {
		return nil, errors.New("服务器错误")
	}

	user := po.Customer{
		Phone:    phone,
		Username: username,
		Password: hashedPassword,
	}
	if err := database.DB().Create(&user).Error; err != nil {
		return nil, errors.New("服务器错误")
	}

	// 签发 token, 注册只支持顾客, 所以这里直接填CUSTOMER
	userID := user.ID
	accessToken, err := myutils.GenerateAccessJWT(userID, restaurant_rpc.LoginRole_LOGIN_ROLE_CUSTOMER, nil)
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	refreshToken, err := myutils.GenerateRefreshJWT(userID, restaurant_rpc.LoginRole_LOGIN_ROLE_CUSTOMER, nil)
	if err != nil {
		return nil, errors.New("服务器错误")
	}

	return &restaurant_rpc.RegisterResp{
		AccessToken:  accessToken,
		RefreshToken: refreshToken,
		Status: &restaurant_rpc.RespStatus{
			Code:    constants.RespStatusSuccess,
			Message: "注册成功",
		},
	}, nil
}

func (s *AuthServer) CanRegisterAdmin(ctx context.Context, req *emptypb.Empty) (*restaurant_rpc.CanRegisterAdminResp, error) {
	// 查询是否有admin
	var adminExists bool
	employee := po.Employee{}
	err := database.DB().Model(&employee).Where("role_type = ?", restaurant_rpc.EmployeeRole_ROLE_ADMIN).Select("1").Scan(&adminExists).Error
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	if adminExists {
		return nil, errors.New("管理员已存在")
	}
	resp := &restaurant_rpc.CanRegisterAdminResp{
		CanRegisterAdmin: true,
	}
	return resp, nil
}

func (s *AuthServer) RegisterAdmin(ctx context.Context, req *restaurant_rpc.RegisterAdminReq) (*restaurant_rpc.RegisterAdminResp, error) {
	phone := req.Phone
	password := req.Password
	repeatedPassword := req.RepeatedPassword
	if phone == "" {
		return nil, errors.New("电话号码不能为空")
	}
	if password == "" {
		return nil, errors.New("密码不能为空")
	}
	if repeatedPassword == "" {
		return nil, errors.New("请再次输入密码")
	}
	if repeatedPassword != password {
		return nil, errors.New("两次输入的密码不一致")
	}
	passwordHash, err := myutils.HashPassword(password)
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	admin := po.Employee{
		Name: phone,
		Phone: phone,
		Password: passwordHash,
		RoleType: restaurant_rpc.EmployeeRole_ROLE_ADMIN,
	}
	err = database.DB().Create(&admin).Error
	// 签发token
	userID := admin.ID
	accessToken, err := myutils.GenerateAccessJWT(userID, restaurant_rpc.LoginRole_LOGIN_ROLE_EMPLOYEE, &admin.RoleType)
	if err != nil {
		return nil, errors.New("服务器错误")
	}
	refreshToken, err := myutils.GenerateRefreshJWT(userID, restaurant_rpc.LoginRole_LOGIN_ROLE_EMPLOYEE, &admin.RoleType)
	if err != nil {
		return nil, errors.New("服务器错误")
	}

	resp := &restaurant_rpc.RegisterAdminResp{
		AccessToken:  accessToken,
		RefreshToken: refreshToken,
		UserID: uint32(userID),
		LoginRole: restaurant_rpc.LoginRole_LOGIN_ROLE_EMPLOYEE,
		EmployeeRole: admin.RoleType,
		Phone: admin.Phone,
		Username: admin.Name,
	}
	return resp, nil
}
