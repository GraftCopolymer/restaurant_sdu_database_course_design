[简体中文](README.zh-CN.md)

# Introduction 

Shandong University 2023 Database Course Design Project: Small Restaurant Management System   Client built with Flutter + Riverpod   Backend implemented using Go + gorm + PostgreSQL   Network communication using Protocol Buffers and gRPC

# Running

## Install Protocol Buffers

Refer to the official GitHub: [Protocol Buffers](https://github.com/protocolbuffers/protobuf#protobuf-compiler-installation)

## Client

Flutter version 3.32.6. Set up Flutter environment by referring to the [Official Flutter Website](https://docs.flutter.dev/get-started/install)

Open terminal, navigate to the project root directory, run:
```shell
flutter pub get
```
Install Dart Protocol Buffers plugin (ensure `~/.pub-cache/bin` is in your PATH):
```shell
dart pub global activate protoc_plugin
```
Run the rpc_gen.sh script in restaurant_front to generate communication code:
```shell
cd restaurant
./rpc_gen.sh
```
Open the restaurant_front directory using Android Studio or VSCode, then run the project.

## Backend

Install Go (version 1.24.5) by referring to the [Official Documentation](https://go.dev/doc/install)

Install Go Protocol Buffers plugin (ensure `$GOPATH/bin` is in your PATH):
```shell
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
```
Run the gen_proto.sh script in restaurant_backend to generate communication code:
```shell
cd restaurant_backend

./gen_proto.sh
```
Additionally, configure image hosting service and JWT key. This project uses Alibaba Cloud OSS solution. Create a config.yaml file in restaurant_backend with:
```yaml
pic_bed:
  accessKeyId: your_oss_access_key_id
  accessKeySecret: your_oss_access_key_secret
  bucketName: your_oss_bucket_name
  endpoint: your_oss_endpoint_url
  region: your_oss_region
  urlExpiredTime: 86400 # you can edit it by yourself

auth:
  jwtSecretKey: your_jwt_key
```
Finally, open the restaurant_backend directory using Goland or your preferred IDE, and run the project.
