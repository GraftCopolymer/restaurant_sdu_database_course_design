package main

import (
	"google.golang.org/grpc"
	"log"
	"net"
	"restaurant_backend/config"
	"restaurant_backend/interceptor"
	"restaurant_backend/restaurant_backend/rpc"
	"restaurant_backend/rpc_impl"
	"sync"
)

//func setupRouter() (router *gin.Engine) {
//	router = gin.Default()
//
//	commonG := router.Group("/common")
//	commonG.GET("/version", func(context *gin.Context) {
//		context.String(http.StatusOK, "1.0")
//	})
//	return
//}
func main() {
	config.InitDatabase()

	wg := sync.WaitGroup{}
	wg.Add(1)
	go func() {
		defer wg.Done()
		lis, err := net.Listen("tcp", ":50051")
		if err != nil {
			log.Fatalf("failed to listen: %v", err)
		}
		grpcServer := grpc.NewServer(
			grpc.UnaryInterceptor(interceptor.AuthInterceptor()),
		)
		restaurant_rpc.RegisterAuthServiceServer(grpcServer, &rpc_impl.AuthServer{})
		restaurant_rpc.RegisterEmployeeServiceServer(grpcServer, &rpc_impl.EmployeeServer{})
		restaurant_rpc.RegisterDishServiceServer(grpcServer, &rpc_impl.DishServer{})
		log.Println("gRPC server running at :50051")
		if err := grpcServer.Serve(lis); err != nil {
			log.Fatalf("failed to serve: %v", err)
		}
	}()
	wg.Wait()
}
