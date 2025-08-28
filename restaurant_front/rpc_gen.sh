export PATH="$HOME/.pub-cache/bin:$PATH"
echo 'start to gen rpc...'
mkdir -p lib/src/generated

protoc \
  -I=rpc \
  -I=./ \
  --dart_out=grpc:lib/src/generated \
  rpc/*.proto \
  google/protobuf/empty.proto\
  rpc/restaurantV2/*.proto # 来自后端的类型定义

echo 'rpc gen finish'