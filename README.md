# TechAI8.com - AI驱动的多语言科技媒体平台

> 基于 Hugo + Blowfish 主题的现代化科技媒体网站，集成 AI 内容生成和多语言支持

## 🌟 项目概述

TechAI8.com 是一个创新的科技媒体平台，专注于 AI 应用、金融科技、Web3 创新和智能硬件领域。通过专业的数字记者团队，为全球用户提供高质量的多语言科技内容。

### 核心特色
- 🤖 **AI 驱动内容**: 基于 GPT-4 的智能内容生成和优化
- 👥 **三位数字记者**: Ava (繁中)、Mika (日文)、Lena (英文) 各具特色的专业记者
- 🌍 **多语言支持**: 英文/繁体中文/日文三语言内容
- 📊 **专业评测**: 严格的测试方法和客观的产品评价
- 🎯 **精准定位**: 针对不同地区市场的本地化内容
- 💰 **商业化就绪**: AdSense 集成、SEO 优化

## 🏗️ 技术架构

### 技术栈
- **静态站点生成器**: Hugo Extended
- **主题**: Blowfish (现代化响应式设计)
- **多语言**: 英文/繁体中文/日文
- **分析**: Google Analytics
- **广告**: Google AdSense (可配置)

### 项目结构

```
techai8.op/
├── config/_default/     # Hugo配置文件
│   ├── hugo.toml       # 主配置
│   ├── params.toml     # 参数配置
│   ├── languages.toml  # 多语言配置
│   └── menus.en.toml   # 菜单配置
├── content/            # 内容目录
│   ├── news/          # 新闻文章
│   ├── reviews/       # 产品评测
│   ├── rankings/      # 排行榜
│   ├── guides/        # 指南教程
│   ├── tutorials/     # 详细教程
│   ├── topics/        # 专题页面
│   ├── resources/     # 资源下载
│   └── about.md       # 关于页面
├── data/              # 数据文件
│   └── authors/       # 作者信息
├── layouts/           # 自定义布局
│   └── shortcodes/    # 短代码组件
├── themes/            # 主题目录
│   └── blowfish/      # Blowfish主题
├── static/            # 静态文件
├── public/            # 生成的网站文件
├── build.sh           # 构建脚本
└── start-server.sh    # 开发服务器启动脚本
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
