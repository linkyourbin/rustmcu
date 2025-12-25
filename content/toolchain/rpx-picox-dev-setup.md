---
date: '2025-08-17T14:14:23+08:00'
draft: true
title: '一分钟，搭建Rust RP 2040/2350 Pico(2)开发环境'
categories: ["toolchain"]
tags: ["rp2040", "rp2350", "pico", "setup", "beginner"]
series: ["开发工具链"]
---
由于已经在`五分钟，带你从安装STM32 Rust嵌入式开发环境，到脱离苦海`这篇博客里详细展示了如何搭建`基座环境`，故本篇博客，不会从头开始，只需要安装对应的`target`即可。

查阅官网资料得知：

`RP 2040 Pico`部分重要信息如下
- Dual ARM Cortex-M0+ @ 133MHz

打开终端，安装对应的`target`（理解为交叉编译工具）

```bash
rustup target add thumbv6m-none-eabi
```
`RP 2350 Pico2`部分重要信息如下

- Dual Cortex-M33 or Hazard3 processors at 150 MHz
打开终端，安装对应的`target`（理解为交叉编译工具）

```bash
rustup target add thumbv8m.main-none-eabihf
```

之后更新的教程，会侧重使用`RP 2350 Pico2`进行演示。