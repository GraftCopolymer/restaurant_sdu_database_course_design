export PATH="$HOME/.pub-cache/bin:$PATH"
echo 'start to gen rpc...'
mkdir -p lib/src/generated
protoc -I=./rpc/ --dart_out=grpc:lib/src/generated ./rpc/*.proto
echo 'rpc gen finish'