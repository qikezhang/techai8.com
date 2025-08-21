# TechAI8.com - Hugo静态网站

这是一个使用Hugo和Mainroad主题搭建的静态网站项目。

## 项目结构

```
techai8.com/
├── config.toml          # Hugo配置文件
├── content/             # 内容目录
│   ├── about.md        # 关于页面
│   ├── post/           # 博客文章
│   └── docs/           # 文档
├── themes/             # 主题目录
│   └── mainroad/       # Mainroad主题
├── static/             # 静态文件
├── public/             # 生成的网站文件
└── start-server.sh     # 启动脚本
```

## 快速开始

### 1. 启动开发服务器

```bash
# 方法1：使用启动脚本
./start-server.sh

# 方法2：直接使用Hugo命令
hugo server --bind 0.0.0.0 --port 1313 --buildDrafts --buildFuture --watch
```

### 2. 访问网站

打开浏览器访问：http://localhost:1313

### 3. 创建新文章

```bash
# 创建新的博客文章
hugo new post/my-new-post.md

# 创建新的文档页面
hugo new docs/my-new-doc.md
```

### 4. 构建生产版本

```bash
# 构建静态网站到public目录
hugo

# 构建包含草稿的版本
hugo --buildDrafts
```

## 配置说明

主要配置在 `config.toml` 文件中：

- `title`: 网站标题
- `languageCode`: 语言代码
- `theme`: 使用的主题名称
- `[Params]`: 主题参数配置
- `[Params.Author]`: 作者信息

## 内容管理

### 文章格式

每篇文章都需要包含Front Matter：

```yaml
---
title: "文章标题"
date: 2025-01-21T10:00:00+08:00
draft: false
categories: ["分类"]
tags: ["标签1", "标签2"]
---

文章内容...
```

### 目录结构

- `content/post/`: 博客文章
- `content/docs/`: 文档页面
- `content/about.md`: 关于页面

## 主题特性

Mainroad主题支持：

- 响应式设计
- 侧边栏小工具
- 搜索功能
- 分类和标签
- 社交媒体链接
- 评论系统（Disqus）
- Google Analytics

## 开发提示

1. 修改内容后，开发服务器会自动重新构建
2. 草稿文章（draft: true）只在开发模式下显示
3. 静态文件放在 `static/` 目录下
4. 自定义样式可以在 `static/css/` 目录下添加

## 部署

构建完成后，`public/` 目录包含所有静态文件，可以直接部署到任何静态网站托管服务。
