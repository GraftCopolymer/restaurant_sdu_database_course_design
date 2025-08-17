#!/bin/bash

# 打印帮助信息
show_help() {
  echo "用法: $0 [create|drop|--help]"
  echo
  echo "环境变量:"
  echo "  PSQL_USER       PostgreSQL 用户名"
  echo "  PSQL_PASSWORD   PostgreSQL 密码"
  echo "  DB_NAME         要操作的数据库名"
  echo
  echo "命令:"
  echo "  create          创建数据库"
  echo "  drop            删除数据库"
  echo "  --help          显示本帮助信息"
}

# 检查参数和环境变量
if [[ "$1" == "--help" ]]; then
  show_help
  exit 0
fi

if [[ -z "$PSQL_USER" || -z "$PSQL_PASSWORD" || -z "$DB_NAME" ]]; then
  echo "错误：环境变量 PSQL_USER、PSQL_PASSWORD 和 DB_NAME 必须设置。"
  echo "使用 --help 查看用法。"
  exit 1
fi

# 执行命令
case "$1" in
  create)
    PGPASSWORD="$PSQL_PASSWORD" psql -U "$PSQL_USER" -d postgres -c "CREATE DATABASE \"$DB_NAME\";"
    if [[ $? -eq 0 ]]; then
      echo "数据库 \"$DB_NAME\" 创建成功。"
    else
      echo "创建数据库失败。"
      exit 1
    fi
    ;;
  drop)
    PGPASSWORD="$PSQL_PASSWORD" psql -U "$PSQL_USER" -d postgres -c "DROP DATABASE IF EXISTS \"$DB_NAME\";"
    if [[ $? -eq 0 ]]; then
      echo "数据库 \"$DB_NAME\" 删除成功。"
    else
      echo "删除数据库失败。"
      exit 1
    fi
    ;;
  *)
    echo "错误：未知命令 \"$1\"。"
    echo "使用 --help 查看用法。"
    exit 1
    ;;
esac