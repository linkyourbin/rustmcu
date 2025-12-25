# Logo 和视觉设计说明

## 当前配置

### 导航栏 Logo
- **位置**: 左上角导航栏
- **文件**: `static/profile/avatar.svg`
- **显示**: Logo图标 + "RUST MCU" 文字
- **高度**: 32px

### Favicon（网站图标）
- **文件**: `static/profile/avatar.svg`
- **用途**: 浏览器标签页图标、书签图标

### 主页头像
- **文件**: `static/profile/avatar.svg`
- **尺寸**: 360x360px
- **用途**: 主页中央展示

---

## 如何创建更专业的 Logo

### 推荐尺寸
- **导航栏 Logo**: 建议 120x32px（横向布局）
- **Favicon**: 16x16px, 32x32px, 180x180px（多种尺寸）
- **主页头像**: 360x360px 或更大

### Logo 设计建议

#### 1. 导航栏横向 Logo
创建一个 `static/logo.svg` 文件，设计要点：
- 横向布局，适合导航栏
- 包含 "RUST MCU" 文字 + 图标
- 简洁、清晰、可识别
- 颜色搭配：
  - Rust 官方橙色: `#CE422B`
  - 深色背景: `#1a1a1a`
  - 浅色背景: `#ffffff`

#### 2. Favicon 方形图标
创建专门的 favicon 文件：
```
static/
├── favicon.ico       # 传统 ICO 格式
├── favicon-16x16.png # 16x16 PNG
├── favicon-32x32.png # 32x32 PNG
└── apple-touch-icon.png # 180x180 PNG（Apple 设备）
```

### 在线工具推荐
- **SVG 编辑**: [Figma](https://figma.com) (免费)
- **Favicon 生成**: [RealFaviconGenerator](https://realfavicongenerator.net/)
- **Logo 设计**: [Canva](https://canva.com) (免费模板)
- **Icon 库**: [Font Awesome](https://fontawesome.com), [Feather Icons](https://feathericons.com)

### 设计灵感
- 🦀 Rust 螃蟹 + 芯片图标
- ⚙️ 齿轮 + 代码符号
- 📟 微控制器轮廓 + "RUST MCU" 文字
- 🔧 工具 + 电路板元素

---

## 更新 Logo 步骤

### 1. 创建横向导航栏 Logo（推荐）
```bash
# 将新 logo 放到 static 目录
cp your-logo.svg static/logo-horizontal.svg
```

然后更新 `hugo.yaml`:
```yaml
params:
  label:
    text: ""  # 如果logo已包含文字，可以留空
    icon: "/logo-horizontal.svg"
    iconHeight: 32
```

### 2. 更新 Favicon
```bash
# 生成多种尺寸的 favicon
# 使用 RealFaviconGenerator 或其他工具

# 将生成的文件放到 static/
static/
├── favicon.ico
├── favicon-16x16.png
├── favicon-32x32.png
└── apple-touch-icon.png
```

更新 `hugo.yaml`:
```yaml
params:
  favicon: "favicon.ico"
  favicon16x16: "favicon-16x16.png"
  favicon32x32: "favicon-32x32.png"
  apple_touch_icon: "apple-touch-icon.png"
```

### 3. 保持主页头像不变
主页中央的头像可以保持使用 `avatar.svg`，它可以与导航栏 logo 不同。

---

## 当前效果

✅ **已配置完成**:
- 导航栏显示: Logo图标 + "RUST MCU" 文字
- 主页标题: "RUST MCU 🦀"
- 主页副标题: "探索 Rust 嵌入式开发的无限可能"
- Favicon: 使用 avatar.svg（临时）

📝 **建议改进**:
1. 创建专门的横向导航栏 logo（更专业）
2. 生成多尺寸 favicon（更好的跨平台支持）
3. 统一视觉风格（logo、颜色、字体）

---

## 快速测试

运行本地预览查看效果：
```bash
hugo server -D
```

访问 `http://localhost:1313` 查看：
- 左上角导航栏的 logo
- 浏览器标签页的 favicon
- 主页的整体设计

---

**需要帮助设计 logo?** 可以提供更详细的设计需求，我可以帮你生成 SVG 代码！
