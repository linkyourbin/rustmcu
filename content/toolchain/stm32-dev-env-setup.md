---
date: '2025-08-15T20:53:18+08:00'
draft: true
title: '五分钟，带你从安装STM32 Rust嵌入式开发环境，到脱离苦海'
categories : ["toolchain"]  
tags : ["stm32"]
---

本篇博客搭建了一个`Rust`嵌入式开发的基础环境，不同的芯片，只需要在此基础上安装对应的`toolchain`和`target`即可，由于是`Windows`环境，为了最完美的兼容和适配，我们选择`MSVC`而不是`GNU`，这是长期实践下来比较完美的方案，若你是新手，无脑照抄即可。

# 安装`Rust`

若使用国内的网络直连，安装`Rust`时可能会耗费大量时间在下载环节，所以先配置一下代理（合理合法，免费使用）。

- 浏览器搜索并打开[`rsproxy.cn`](rsproxy.cn)，可以看到其主页介绍的用法是`Linux`/`MAC`系统下的常用方式，我们侧重介绍如何在`Windows`系统下配置，`Windows 10`/`Windows 11`均可。
![](/toolchain-images/rsproxy_main_page.png)

- 按下键盘上的`Win`键，输入`edit environment variables for your account`/`环境变量`，打开环境变量编辑页面。
![](/toolchain-images/env_variable_overview.png)
图上是已经配置好的效果，具体操作方法如下
   - 点击`Edit`/`编辑`，将`RUSTUP_DIST_SERVER`和`https://rsproxy.cn`，依次填入相应位置
![](/toolchain-images/rsproxy_server.png)
   - 如法炮制，再将`RUSTUP_UPDATE_ROOT`和`https://rsproxy.cn/rustup`填入相应位置
![](/toolchain-images/rsproxy_updateroot.png)

- 安装`Rust`
  - [`Rust Installer`](https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe)，点击直接下载
  - 下载完成后，双击打开即可
![](/toolchain-images/rust_install_00.png)
  - 输入`1`，按下回车（`Enter`），之后的弹窗继续点击`Yes`
  - 继续点击`Continue`
![](/toolchain-images/rust_install_01.png)
![](/toolchain-images/rust_install_02.png)
  - 点击`Install`
![](/toolchain-images/rust_install_03.png)
  - 等待进度条跑完
![](/toolchain-images/rust_install_04.png)
  - 完成
![](/toolchain-images/rust_install_05.png)
  - 完成以上步骤之后，`Rust Installer`会继续引导我们完成接下来的步骤
    - 可以看到，已经识别到了`host`, `toolchain`等信息
![](/toolchain-images/rust_install_06.png)
  - 现在输入`2`，并且按下回车（`Enter`）确认
![](/toolchain-images/rust_install_07.png)
  - 继续回车（`Enter`）
![](/toolchain-images/rust_install_08.png)
  - 输入`nightly`，继续回车（`Enter`）
![](/toolchain-images/rust_install_09.png)
  - 接下来一直点回车（`Enter`）即可，以下是安装过程，耐心等待即可
![](/toolchain-images/rust_install_10.png)
  - 命令行窗口提示：`Rust is installed now. Great!`，则说明安装成功
![](/toolchain-images/rust_install_11.png)
  - 按下回车（`Enter`）即可
  - 打开`Visual Studio Installer`，安装一些必备组件，之后编译项目或者工具的时候需要用到，点击`Modify`
![](/toolchain-images/rust_install_12.png)
  - 勾选`Desktop development with C++`，点击`Modify`，之后的弹窗点击`Yes`即可
![](/toolchain-images/rust_install_13.png)
  - 等待进度条跑满（下载速度能到`100MB/s`，使用`SSD`的情况下，估计两分钟就完成了）
![](/toolchain-images/rust_install_14.png)
  - 安装完成会再次回到这个界面，关闭即可
![](/toolchain-images/rust_install_15.png)

- 若只是安装`Rust`，并且只是用标准库（无法做嵌入式开发），则完成以上步骤即可，但`Rust`嵌入式会频繁使用到[`crates.io`](https://crates.io/)的一些`crate`（理解成其他语言的库/模块），所以还需要配置拉取`rsproxy`提供的镜像（一分钟更新一次，可以近似理解为不会过时），具体操作步骤如下
   - 按下`Win`+`E`，打开资源管理器，进入`C`盘下的`user`目录，进入当前用户目录（我的是`Admin`，顺便一提，用户名最好是英文或者数字，不要用中文或者夹杂一些其他符号），继续进入`.cargo`目录，如果顺利，你当前的`PWD`应该类似是这样的：`C:\Users\Admin\.cargo`，紧接着复制`rsproxy`主页代码块里的配置文件
![](/toolchain-images/rsproxy_crates_io.png)
   - 在当前目录下（`C:\Users\Admin\.cargo`）新建一个`config.toml`文件，将以下`toml`配置，粘贴进去（可以新建一个`config.txt`文件，将内容粘贴进去后，再将后缀更改为`toml`即可）
```toml
[source.crates-io]
replace-with = 'rsproxy-sparse'
[source.rsproxy]
registry = "https://rsproxy.cn/crates.io-index"
[source.rsproxy-sparse]
registry = "sparse+https://rsproxy.cn/index/"
[registries.rsproxy]
index = "https://rsproxy.cn/crates.io-index"
[net]
git-fetch-with-cli = true   
```
# 安装实用工具
- 代码编辑软件和插件
  - 软件
    - 选用`vscode`作为编辑器足矣
      - 至于`nvim`和`zed`或者是其余的`editor`/`IDE`，并不适合新手入门，而且`vscode`也不算过时
  - 插件
    - `rust-lang.rust-analyzer`：提供`Rust LSP`，当前最优秀的`Rust`语言服务器，`vscode + RA`的好用程度远超`JetBrains`家的`RustRover`
    - `fill-labs.dependi`：帮助管理`crate`，更直观的看到当前工程下`crate`的版本信息
    - `tamasfe.even-better-toml`：提供`toml`语法高亮和补全
    - `probe-rs.probe-rs-debugger`：调试服务器
      - 以上所有插件，直接复制名称，粘贴在`vscode`的插件市场的搜索栏里，回车搜索，点击安装即可
- 安装交叉编译工具链和下常用工具
  - 打开命令行，输入以下命令，并按下回车（`Enter`），按照顺序执行即可
```bash
# 请自行查阅数据手册确定自己的芯片架构和硬件浮点支持

# Cortex-M0 和 Cortex-M0+（无硬件浮点）
rustup target add thumbv6m-none-eabi

# Cortex-M3（无硬件浮点）
rustup target add thumbv7m-none-eabi

# Cortex-M4（无硬件浮点）和 Cortex-M7（无硬件浮点）
rustup target add thumbv7em-none-eabi

# Cortex-M4F（带硬件浮点）和 Cortex-M7F（带硬件浮点）
rustup target add thumbv7em-none-eabihf

# 安装 cargo-binstall，用于快速安装已打包的工具
cargo install cargo-binstall

# 安装二进制工具（如 objdump/size 等）
cargo install cargo-binutils

# 安装 probe-rs 相关调试工具（后续用于烧录/调试）
# 执行完之后，会要求输入yes/no，输入yes，回车即可
cargo binstall probe-rs-tools

```
  - 安装以上工具时，会先拉取依赖的`crate`，再进行编译，`CPU`会瞬间跑满，风扇起飞，给出一个执行`cargo install cargo-binstall`的参考
![](/toolchain-images/tools_compling_process.png)

至此，若只开发`STM32`常用芯片（`STM32F1xx`, `STM32F4xx`, `STM32H7xx`, `STM32G4xx`），则以上环境配置足矣，若还要继续开发其他架构的芯片，例如`Cortex M33`架构，则需要安装其他的交叉编译工具（若是想要提前尝鲜，也可求助`LLM`）。至于`RP 2040/235X Pico(2)`和`ESP32`的开发环境，会分别各自单开一篇博客来讲，若是复用到本篇博客，我也会详细注明。

`Rust`本身就是一门~~反复入门，不断卸载重装的~~语言，若是学习过程让你感觉到吃力，不舒服，你想继续回归`C/C++`嵌入式，请按照以下步骤完成卸载。

---

# 卸载`Rust`嵌入式开发环境
- 卸载`Rust`及工具链
  - 打开`CMD`/`Powershell`，输入以下命令，并且回车（`Enter`）确认
  ```bash
  rustup self uninstall
  ```
  ![](/toolchain-images/rust_uninstall_cmd.png)
  - 继续输入`y`，按下回车（`Enter`）
  ![](/toolchain-images/rust_uninstall_enter.png)
  - 命令行出现以下结果，则说明卸载成功
  ![](/toolchain-images/rust_uninstall_finished.png)
- 卸载`Visual Studio Community`
  - 打开`geek uninstaller`，若是没有，请自行搜索安装
  - 找到`Visual Studio Community`，右键，点击`Uninstall`
![](/toolchain-images/geek_uninstall_vs_00.png)
  - 在弹出的`Visual Studio Installer`窗口点击`OK`
![](/toolchain-images/geek_uninstall_vs_01.png)
  - 片刻等待之后，卸载完成
![](/toolchain-images/geek_uninstall_vs_02.png)
  - 继续卸载`Build Tools`，点击`Uninstall`，继续点击`OK`
![](/toolchain-images/geek_uninstall_vs_03.png)
  - 出现以下界面，则完成卸载
![](/toolchain-images/geek_uninstall_vs_04.png)
  - 再次回到`geek uninstaller`，会自动弹窗清理无用注册表，点击`Finish`即可
![](/toolchain-images/geek_uninstall_vs_05.png)

完成以上步骤之后，`Rust`嵌入式开发便与你再无交集，恭喜脱离苦海。

---