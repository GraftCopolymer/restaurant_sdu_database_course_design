package interceptor

import (
	"context"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
	"restaurant_backend/database"
	"restaurant_backend/logger"
	myutils "restaurant_backend/my_utils"
	"restaurant_backend/po"
	"strings"
	"time"
)

// 白名单, 在里面的接口不会验证其metadata
var authWhitelist []string = []string{
	"/restaurant_rpc.AuthService/Register",
	"/restaurant_rpc.AuthService/Login",
	"/restaurant_rpc.AuthService/CanRegisterAdmin",
	"/restaurant_rpc.AuthService/RegisterAdmin",
}
func AuthWhitelist() []string {
	return authWhitelist
}

func AuthInterceptor() grpc.UnaryServerInterceptor {
	return func(
		ctx context.Context,
		req any,
		info *grpc.UnaryServerInfo,
		handler grpc.UnaryHandler,
	) (resp any, err error) {
		// 检查是否是白名单接口
		for _, v := range AuthWhitelist() {
			logger.Logger().Info(info.FullMethod)
			if v == info.FullMethod {
				return handler(ctx, req)
			}
		}
		md, ok := metadata.FromIncomingContext(ctx)
		if !ok {
			return nil, status.Error(codes.Unauthenticated, "Missing metadata")
		}
		authHeaders := md["authorization"]
		if len(authHeaders) == 0 {
			return nil, status.Error(codes.Unauthenticated, "Missing authorization header")
		}
		token := strings.TrimPrefix(authHeaders[0], "Bearer")
		if !validateToken(token) {
			return nil, status.Error(codes.Unauthenticated, "invalid token")
		}
 		return handler(ctx, req)
	}
}

func validateToken(token string) bool {
	tokenStruct, err := myutils.ParseJWT2Struct(token)
	if err != nil {
		return false
	}
	if tokenStruct.Exp >= time.Now().UTC().Unix() {
		// token已过期
		return false
	}
	// 验证用户是否存在
	userID := tokenStruct.UserID
	user := &po.Employee{}
	err = database.DB().Where("id = ?", userID).First(&user).Error
	if err != nil {
		return false
	}
	return true
}
