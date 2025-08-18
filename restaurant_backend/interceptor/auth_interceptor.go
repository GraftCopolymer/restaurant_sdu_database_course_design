package interceptor

import (
	"context"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
	"strings"
)

func AuthInterceptor() grpc.UnaryServerInterceptor {
	return func(
		ctx context.Context,
		req any,
		info *grpc.UnaryServerInfo,
		handler grpc.UnaryHandler,
	) (resp any, err error) {
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
	return true
}
