#!/bin/bash

# 检查是否有路径
if [ -z "$1" ]; then
    echo "请输入文件名！"
    exit 1
fi

# 检查是否有输入标题
if [ -z "$2" ]; then
    echo "请输入文件名！"
    exit 1
fi

# 格式化日期
formatted_date=$(date +"%Y-%m-%d %H:%M:%S")

# 创建Markdown文件
echo "---
title: $2
date: $formatted_date
---" > "$1/$2.md"

# 打开Markdown文件
open "$1/$2.md"

echo "Markdown文件已创建并打开： $1/$2"
