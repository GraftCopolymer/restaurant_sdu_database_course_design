# 创建所需目录
mkdir -p po
mkdir -p pb
mkdir -p rpc_api
# 设置环境变量
export PATH="$PATH:$(go env GOPATH)/bin"
# 生成数据库模型所需数据
#protoc -I=./po/proto --go_out=./ ./po/proto/*.proto
# 生成rpc接口
protoc -I=./rpc --go_out=./ --go-grpc_out=./ ./rpc/*.proto