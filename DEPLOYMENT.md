# TechAI8.com 部署指南

本文档介绍 TechAI8.com 的自动化部署流程和配置。

## 🚀 当前部署架构

### 自动化部署流程
```
本地开发 → GitHub → GitHub Actions → Hugo 构建 → Cloudflare VPS → https://techai8.com
```

### 仓库结构
- **主仓库**: `https://github.com/qikezhang/techai8.com` (网站代码)
- **文档仓库**: `https://github.com/qikezhang/techai8.op` (技术文档)
- **生产域名**: `https://techai8.com`

## 📝 日常部署流程

### 本地开发
```bash
# 1. 启动开发服务器
./start-server.sh
# 或者
hugo server -D

# 2. 访问本地预览
open http://localhost:1313
```

### 发布到生产环境
```bash
# 1. 提交所有更改
git add .
git commit -m "描述你的更改"

# 2. 推送到 GitHub
git push origin main

# 3. 自动部署 (无需手动操作)
# GitHub Actions 会自动：
# - 检测到推送
# - 运行 Hugo 构建
# - 部署到 Cloudflare VPS
# - 更新 https://techai8.com
```

### 部署状态检查
- **GitHub Actions**: 查看构建日志
- **网站状态**: 访问 https://techai8.com 确认更新
- **构建时间**: 通常 2-5 分钟完成部署

## 🔧 技术配置详情

### 当前部署架构
- **托管平台**: Cloudflare VPS
- **构建工具**: GitHub Actions + Hugo
- **CDN**: Cloudflare 全球加速
- **域名**: techai8.com (自动 HTTPS)

### GitHub Actions 工作流
当前使用的自动化部署配置已设置完成，包括：
- 代码推送触发
- Hugo 构建 (--minify)
- 自动部署到 Cloudflare VPS
- 域名和 SSL 自动配置

### 替代部署选项 (备用方案)

#### Vercel 部署
1. 导入 GitHub 仓库到 Vercel
2. 自动检测 Hugo 项目配置
3. 一键部署和自定义域名

#### Netlify 部署
1. 连接 GitHub 仓库
2. 构建命令: `hugo --minify`
3. 发布目录: `public`

## 自动化部署

### GitHub Actions示例

创建 `.github/workflows/deploy.yml`：

```yaml
name: Deploy Hugo site

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
      with:
        submodules: true
        fetch-depth: 0

    - name: Setup Hugo
      uses: peaceiris/actions-hugo@v2
      with:
        hugo-version: 'latest'
        extended: true

    - name: Build
      run: hugo --minify

    - name: Deploy
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./public
```

## 域名配置

### 自定义域名

1. 在域名提供商处配置DNS记录
2. 添加CNAME记录指向托管平台
3. 在托管平台配置自定义域名

### SSL证书

大多数现代托管平台都提供免费的SSL证书：

- GitHub Pages：自动提供
- Netlify：自动提供
- Vercel：自动提供

## 性能优化

### 1. 图片优化

- 使用WebP格式
- 压缩图片大小
- 使用CDN加速

### 2. 缓存配置

在Web服务器配置中设置适当的缓存头：

```nginx
# Nginx示例
location ~* \.(css|js|png|jpg|jpeg|gif|ico|svg)$ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}
```

### 3. 内容压缩

启用Gzip或Brotli压缩：

```nginx
# Nginx示例
gzip on;
gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
```

## 监控和分析

### Google Analytics

在 `config.toml` 中添加：

```toml
googleAnalytics = "GA_TRACKING_ID"
```

### 其他分析工具

- Plausible Analytics
- Fathom Analytics
- Cloudflare Analytics

## 备份策略

1. **代码备份**：使用Git版本控制
2. **内容备份**：定期备份content目录
3. **配置备份**：备份config.toml文件

## 故障排除

### 常见问题

1. **构建失败**：检查Hugo版本兼容性
2. **样式丢失**：检查baseURL配置
3. **图片不显示**：检查静态文件路径

### 调试技巧

```bash
# 本地调试
hugo server --verbose --debug

# 检查构建输出
hugo --verbose
```

## 安全考虑

1. **HTTPS**：始终使用HTTPS
2. **CSP**：配置内容安全策略
3. **更新**：定期更新Hugo和主题

---

选择适合您需求的部署方案，开始发布您的网站吧！
