---
date: '2025-08-17T13:49:27+08:00'
draft: true
title: '一分钟安装 ESP32 Rust 开发环境'
categories : ["toolchain"]  
tags : ["esp32"]
---
# 注意

由于一部分工具链可以复用，理解为将之前的开发环境作为基座，所以不再要求从头开始单独配置`ESP32`的开发环境，请先阅读完`五分钟，带你从安装STM32 Rust嵌入式开发环境，到脱离苦海`这篇博客，再继续接下来的操作。

---

# 按照顺序，执行以下命令

只要完成了`基座环境`的搭建，以下步骤就不会出错，故不再搭配图片说明。

```bash
# 根据模板生成工程
cargo install esp-generate
# esp32开发包安装工具
cargo binstall espup 
# 安装esp32开发包
espup install
# 安装烧录工具
cargo install espflash
```
完成以上步骤之后，`ESP32`的开发环境就搭建完毕了。恭喜，你的技术栈又丰富了许多。
---