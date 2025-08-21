# 部署指南

本文档介绍如何将TechAI8.com网站部署到各种托管平台。

## 构建网站

在部署之前，首先需要构建静态网站：

```bash
# 使用构建脚本
./build.sh

# 或者直接使用Hugo命令
hugo
```

构建完成后，所有静态文件将生成在 `public/` 目录中。

## 部署选项

### 1. GitHub Pages

1. 将代码推送到GitHub仓库
2. 在仓库设置中启用GitHub Pages
3. 选择从 `main` 分支的 `public/` 目录部署

### 2. Netlify

1. 连接GitHub仓库到Netlify
2. 设置构建命令：`hugo`
3. 设置发布目录：`public`
4. 自动部署设置完成

### 3. Vercel

1. 导入GitHub仓库到Vercel
2. Vercel会自动检测Hugo项目
3. 自动配置构建和部署设置

### 4. 传统Web服务器

1. 运行 `./build.sh` 构建网站
2. 将 `public/` 目录中的所有文件上传到服务器
3. 配置Web服务器指向上传的文件

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
