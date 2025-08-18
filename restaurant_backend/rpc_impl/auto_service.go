package rpc_impl

import (
	"context"
	"github.com/golang-jwt/jwt/v5"
	"google.golang.org/grpc/status"
	"log"
	"restaurant_backend/restaurant_rpc"
	"time"
)

var jwtKey = []byte("my_secret_key")

type AuthServer struct {
	restaurant_rpc.UnimplementedAuthServiceServer
}

func (s *AuthServer) Login(ctx context.Context, req *restaurant_rpc.LoginReq) (*restaurant_rpc.LoginResp, error) {
	log.Println("登录")
	// 简单验证
	if req.Username != "admin" || req.Password != "123456" {
		return nil, status.Errorf(16, "invalid credentials") // StatusUnauthenticated
	}

	// 生成 JWT
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"username": req.Username,
		"exp":      time.Now().Add(time.Hour).Unix(),
	})
	tokenString, err := token.SignedString(jwtKey)
	if err != nil {
		return nil, err
	}

	return &restaurant_rpc.LoginResp{AccessToken: tokenString, Status: &restaurant_rpc.RespStatus{Code: 0, Message: "Login success"}}, nil
}

func (s *AuthServer) Register(ctx context.Context, req *restaurant_rpc.RegisterReq) (*restaurant_rpc.RegisterResp, error) {
	if req.Username == "admin" && req.Password == "123456" && req.RepeatedPassword == req.Password {
		return &restaurant_rpc.RegisterResp{
			AccessToken: "🐮",
			RefreshToken: "🍺",
			Status: &restaurant_rpc.RespStatus{
				Code: 0,
				Message: "太厉害啦",
			},
		}, nil
	}
	return &restaurant_rpc.RegisterResp{
		Status: &restaurant_rpc.RespStatus{
			Code: -1,
			Message: "注册失败",
		},
	}, nil
}
