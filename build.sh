#!/bin/bash

# 构建Hugo静态网站
echo "开始构建Hugo静态网站..."

# 清理之前的构建
rm -rf public

# 构建网站
hugo

echo "构建完成！生成的文件在 public/ 目录中。"
echo "您可以将 public/ 目录的内容部署到任何静态网站托管服务。"
