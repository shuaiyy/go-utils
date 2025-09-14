#!/bin/bash

# 定义主版本号
MAIN_VERSION="v0.0.1"

# 定义模块及其版本
declare -A MODULE_VERSIONS=(
    ["bank_card"]="v0.0.1"
    ["geoip"]="v0.0.1"
    ["translator"]="v0.0.1"
    ["copierutil"]="v0.0.1"
    ["jwtutil"]="v0.0.1"
    ["id"]="v0.0.1"
    ["slug"]="v0.0.1"
    ["name_generator"]="v0.0.1"
    ["mapper"]="v0.0.1"
    ["password"]="v0.0.1"
    ["query_parser"]="v0.0.1"
    ["entgo"]="v0.0.1"
    ["gorm"]="v0.0.1"
)

echo "创建主版本标签..."
git tag $MAIN_VERSION

echo "创建模块版本标签..."
for module in "${!MODULE_VERSIONS[@]}"; do
    version="${MODULE_VERSIONS[$module]}"
    echo "创建标签: $module/$version"
    git tag "$module/$version"
done

echo "推送所有标签到远程仓库..."
git push origin --tags
