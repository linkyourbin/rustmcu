---
date: '2025-08-18T14:38:28+08:00'
draft: true
title: 'ESP32C3读取DHT11温湿度信息'
categories : ["esp32"]  
tags : ["esp32C3", "DHT11"]
---
# 前言和实验结果
> 跳过`Hello World`，即点亮`LED`，直接实战读取`DHT11`温湿度传感器。

![](/memes/exhausted.jpg)

最后实现的效果如下。

![](/esp32/esp32c3/dht11/dht11-measuring-result.png)

> 如上图，可以在终端`Terminal`里直接看到`DHT11`测量到的温湿度信息，无需额外的串口。终端里也支持中文信息输出，感兴趣可以自己上手实测。

# 使用`esp-generate`生成模板工程

> 由于过程具有重复性，故不再重复演示，请点击跳转<a href="/esp32/esp-generate-template/" style="color: #e16054ff; font-weight: bold; font-style: italic;">使用esp-generate生成一个ESP32初始工程</a>

# 打开工程
- 导入需要用到的`crate`，在工程根目录下打开终端，输入以下命令，并按下回车（`Enter`）

```rust
cargo add esp32-dht11-rs
```
在`main.rs`里输入以下代码
- 在头部的位置，先引入需要使用的`crate`

```rust
use esp32_dht11_rs::{DHT11};
use esp_hal::delay::Delay;
```
- 接着，来到`main`函数里

```rust
let delay = Delay::new();
let mut dht11 = DHT11::new(peripherals.GPIO0, delay);
let mut dht11_read_counter = 1;
```
- 再将以下内容复制到`loop`函数里

```rust
match dht11.read() {
            Ok(m) => println!("DHT11 TEMP is: {}℃ DHT11 HUMI is:{}% measuring for [NO.{:?}] time", m.temperature, m.humidity, dht11_read_counter),
            Err(error) => println!("error occured: {:?}", error),
        }
        Timer::after_millis(2000).await;
        dht11_read_counter += 1;
```
- 断电前提下，连接硬件
| 功能 | DHT11 | ESP32C3 |
|------|--------|-------------------------------|
| 电源正极 | VCC    | 3V3                          |
| 地线   | GND    | GND                          |
| 数据线 | D / DAT | GPIO0 / 引脚 0               |

- 连接好硬件之后，将开发板连接到电脑，回到终端，输入以下命令
> 需要自行安装`CH34x`的驱动，这一步不做说明，自行安装即可。
```bash
cargo run --release
```
可以看到终端里在进行编译`compiling`。

![](/esp32/esp32c3/dht11/terminal-compiling.png)

完成之后，会自动进行烧录，期间不需要按开发板上的任何按键（试过很多板子，都不需要按`BOOT`）。

![](/esp32/esp32c3/dht11/terminal-compiling-done.png)

烧录完成后，正常在终端里打印信息，若是用手握住`DHT11`模块，湿度会瞬间上升，温度也会开始缓慢上升（假定你手现在并没有进行过冷冻处理，是正常体温。），说明模块工作正常，程序正常运行。

![](/esp32/esp32c3/dht11/dht11-running-ok.png)


