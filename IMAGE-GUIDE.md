# 📸 图片管理指南

本指南介绍如何在Hugo网站中有效管理和使用图片。

## 📁 目录结构

### 推荐的图片目录结构

```
static/
├── img/
│   ├── posts/                    # 文章图片
│   │   ├── article-name/         # 每篇文章一个目录
│   │   │   ├── cover.jpg         # 封面图
│   │   │   ├── screenshot1.png   # 截图1
│   │   │   └── diagram.svg       # 图表
│   │   └── another-article/
│   ├── pages/                    # 页面图片
│   │   ├── about/
│   │   └── contact/
│   ├── common/                   # 通用图片
│   │   ├── logo.png
│   │   ├── avatar.jpg
│   │   └── icons/
│   └── uploads/                  # 临时上传
```

## 🖼️ 图片格式建议

### 格式选择

| 用途 | 推荐格式 | 原因 |
|------|----------|------|
| 照片 | WebP > JPEG | 更好的压缩率 |
| 图标 | SVG > PNG | 矢量可缩放 |
| 截图 | PNG > WebP | 保持清晰度 |
| 动图 | WebP > GIF | 文件更小 |

### 尺寸建议

- **文章封面**: 1200x630px (适合社交分享)
- **内容图片**: 最大宽度1200px
- **缩略图**: 300x200px
- **头像**: 200x200px

### 文件大小

- **封面图**: < 200KB
- **内容图片**: < 500KB
- **缩略图**: < 50KB
- **图标**: < 20KB

## 📝 在Markdown中使用图片

### 基本语法

```markdown
![图片描述](/img/posts/article-name/image.jpg)
```

### 带标题的图片

```markdown
![图片描述](/img/posts/article-name/image.jpg)
*图片标题或说明*
```

### 响应式图片

```markdown
<img src="/img/posts/article-name/image.jpg" 
     alt="图片描述" 
     style="max-width: 100%; height: auto;">
```

### 图片链接

```markdown
[![图片描述](/img/posts/article-name/image.jpg)](/img/posts/article-name/image-large.jpg)
```

## 🛠️ 图片优化工具

### 在线工具

- **TinyPNG**: PNG/JPEG压缩
- **Squoosh**: Google的图片优化工具
- **Convertio**: 格式转换

### 命令行工具

```bash
# 安装ImageMagick
brew install imagemagick

# 批量调整大小
magick mogrify -resize 1200x -quality 85 *.jpg

# 转换为WebP
magick convert image.jpg image.webp
```

## 📤 添加图片的完整流程

### 方法一：本地添加（推荐）

1. **准备图片**
   ```bash
   # 创建文章图片目录
   mkdir -p static/img/posts/your-article-name
   ```

2. **优化图片**
   - 调整尺寸到合适大小
   - 压缩文件大小
   - 转换为合适格式

3. **复制图片**
   ```bash
   # 将图片复制到目录
   cp ~/Downloads/image.jpg static/img/posts/your-article-name/
   ```

4. **在文章中引用**
   ```markdown
   ![图片描述](/img/posts/your-article-name/image.jpg)
   ```

### 方法二：GitHub直接上传

1. 在GitHub仓库中导航到 `static/img/posts/`
2. 创建新目录（文章名称）
3. 上传图片文件
4. 在文章中使用相对路径引用

## 🔧 高级技巧

### 图片懒加载

```html
<img src="/img/posts/article-name/image.jpg" 
     alt="图片描述" 
     loading="lazy">
```

### 图片集合

```markdown
<div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 1rem;">
  <img src="/img/posts/article-name/image1.jpg" alt="图片1">
  <img src="/img/posts/article-name/image2.jpg" alt="图片2">
  <img src="/img/posts/article-name/image3.jpg" alt="图片3">
</div>
```

### 图片水印

```bash
# 使用ImageMagick添加水印
magick composite -gravity southeast -geometry +10+10 \
  watermark.png original.jpg watermarked.jpg
```

## 📋 检查清单

### 添加图片前

- [ ] 图片已优化（尺寸和文件大小）
- [ ] 选择了合适的格式
- [ ] 文件名使用英文和连字符
- [ ] 准备了alt文本描述

### 添加图片后

- [ ] 本地预览图片显示正常
- [ ] 图片路径正确
- [ ] 移动端显示良好
- [ ] 加载速度可接受

### 发布前

- [ ] 所有图片都已提交到Git
- [ ] 图片在生产环境正常显示
- [ ] SEO优化（alt文本、文件名）
- [ ] 版权问题已确认

## ⚠️ 注意事项

### 版权问题

- 使用自己拍摄的照片
- 使用免费商用图片网站
- 购买正版图片授权
- 注明图片来源

### 性能优化

- 避免使用过大的图片
- 考虑使用CDN加速
- 启用图片压缩
- 使用适当的缓存策略

### 无障碍访问

- 为所有图片添加alt文本
- 使用描述性的文件名
- 确保足够的对比度
- 提供图片的文字描述

---

遵循这些最佳实践，您的网站图片将既美观又高效！
