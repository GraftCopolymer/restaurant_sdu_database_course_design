package interceptor

import (
	"context"
	"errors"
	"github.com/golang-jwt/jwt/v5"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
	config2 "restaurant_backend/config"
	"restaurant_backend/database"
	"restaurant_backend/logger"
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
		token := strings.TrimPrefix(authHeaders[0], "Bearer ")
		if !validateToken(token) {
			return nil, status.Error(codes.Unauthenticated, "invalid token")
		}
 		return handler(ctx, req)
	}
}

// 验证token是否有效
func validateToken(token string) bool {
	parsed, err := jwt.Parse(token, func(token *jwt.Token) (interface{}, error) {
		// 检查签名算法是否正确
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, errors.New("不支持的签名方法")
		}
		return []byte(config2.Config.Auth.JwtSecretKey), nil
	})
	if err != nil || !parsed.Valid {
		return false
	}

	claims, ok := parsed.Claims.(jwt.MapClaims)
	if !ok {
		return false
	}

	// 过期时间检查
	expFloat, ok := claims["exp"].(float64)
	if !ok {
		return false
	}
	if int64(expFloat) < time.Now().UTC().Unix() {
		return false
	}

	// 用户 ID 检查
	userIDFloat, ok := claims["user_id"].(float64)
	if !ok {
		return false
	}
	userID := uint(userIDFloat)

	user := &po.Employee{}
	if err := database.DB().Where("id = ?", userID).First(&user).Error; err != nil {
		return false
	}

	return true
}
