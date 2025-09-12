[English](README.md)

# 介绍

山东大学2023级数据库课程设计项目：小型餐馆运营系统，使用客户端使用 Flutter + Riverpod 实现，后端采用 Go + gorm + PostgreSQL 实现，网络通信使用 Protocol Buffers 和 gRPC

# 运行

## 安装 Protocol Buffers

参考官方Github：[Protocol Buffers](https://github.com/protocolbuffers/protobuf#protobuf-compiler-installation)

## 客户端

Flutter 版本 3.32.6, Flutter 环境配置参考 [Flutter 官网](https://docs.flutter.dev/get-started/install)

打开终端，进入项目根目录，运行：

```shell
flutter pub get
```

安装 Dart Protocol Buffers 插件 (请确保`~/.pub-cache/bin`在环境变量中)：

```shell
dart pub global activate protoc_plugin
```

运行 restaurant_front/rpc_gen.sh 脚本以生成通信代码：

```shell
cd restaurant
./rpc_gen.sh
```

使用 Android Studio 或者 VSCode 打开 restaurant_front 目录，运行

## 后端

安装 Go，版本1.24.5，参考[官方文档](https://go.dev/doc/install)

安装 Go Protocol Buffers 插件 (请确保`$GOPATH/bin`在环境变量中)：

```shell
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
```

运行 restaurant_backend/gen_proto.sh 脚本以生成通信代码：

```shell
cd restaurant_backend
./gen_proto.sh
```

除此之外，还需要配置图床信息 和 JWT key，本项目使用阿里云OSS方案。在 restaurant_backend 中新建 config.yaml 文件，输入：

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

最后，使用 Goland 或其他你喜欢的 IDE 打开 restaurant_backend 目录，运行

