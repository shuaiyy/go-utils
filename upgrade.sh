#!/bin/bash

script_dir="$(dirname "$(readlink -f "$0")")"
echo "Script directory: $script_dir"
# 指定起始文件夹
DIR="$script_dir"

# 定义需要更新的模块列表
MODULES=(
    "bank_card"
    "geoip" 
    "copierutil"
    "translator"
    "entgo"
    "gorm"
)

# 更新根目录依赖
echo "更新根目录依赖..."
go get all
go mod tidy

# 遍历并更新各个模块
for module in "${MODULES[@]}"
do
    echo "更新模块: $module"
    cd "$DIR/$module"
    go get all
    go mod tidy
done