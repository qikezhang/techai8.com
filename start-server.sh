#!/bin/bash

# 启动Hugo开发服务器
echo "启动Hugo开发服务器..."
hugo server --bind 0.0.0.0 --port 1313 --buildDrafts --buildFuture --watch
