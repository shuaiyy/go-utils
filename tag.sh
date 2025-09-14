#!/bin/bash

# 定义主版本号
MAIN_VERSION="v0.0.3"

# 定义模块列表
MODULES=(
    "bank_card"
    "geoip"
    "translator"
    "copierutil"
    "jwtutil"
    "id"
    "slug"
    "name_generator"
    "mapper"
    "password"
    "query_parser"
    "entgo"
    "gorm"
)

# 定义模块版本
MODULE_VERSION="$MAIN_VERSION"

echo "创建主版本标签..."
git tag $MAIN_VERSION

echo "创建模块版本标签..."
for module in "${MODULES[@]}"; do
    echo "创建标签: $module/$MODULE_VERSION"
    git tag "$module/$MODULE_VERSION"
done

echo "推送所有标签到远程仓库..."
git push origin --tags
