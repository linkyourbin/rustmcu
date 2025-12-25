+++
title = "MCU 平台"
url = "/mcu-platforms/"
date = 2025-12-25
layout = "single"
+++

<style>
.mcu-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 24px;
  margin: 32px 0;
}

.mcu-card {
  background: var(--entry);
  border: 1px solid var(--border);
  border-radius: 12px;
  padding: 24px;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.mcu-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 4px;
  background: linear-gradient(90deg, #CE422B, #ff6b4a);
  transform: scaleX(0);
  transform-origin: left;
  transition: transform 0.3s ease;
}

.mcu-card:hover::before {
  transform: scaleX(1);
}

.mcu-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
  border-color: #CE422B;
}

.mcu-icon {
  font-size: 48px;
  margin-bottom: 16px;
  display: block;
  transition: transform 0.3s ease;
}

.mcu-card:hover .mcu-icon {
  transform: scale(1.1) rotate(5deg);
}

.mcu-title {
  font-size: 24px;
  font-weight: 600;
  margin-bottom: 8px;
  color: var(--content);
}

.mcu-subtitle {
  font-size: 14px;
  color: var(--secondary);
  margin-bottom: 12px;
}

.mcu-desc {
  font-size: 14px;
  line-height: 1.6;
  color: var(--content);
  margin-bottom: 16px;
}

.mcu-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  margin-top: 16px;
}

.mcu-tag {
  font-size: 12px;
  padding: 4px 12px;
  background: rgba(206, 66, 43, 0.1);
  color: #CE422B;
  border-radius: 12px;
  transition: all 0.2s ease;
}

.mcu-card:hover .mcu-tag {
  background: #CE422B;
  color: white;
}

.intro-section {
  text-align: center;
  padding: 48px 0 32px;
  animation: fadeIn 0.6s ease-out;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.intro-title {
  font-size: 36px;
  font-weight: 700;
  margin-bottom: 16px;
  background: linear-gradient(135deg, #CE422B, #ff6b4a);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.intro-subtitle {
  font-size: 18px;
  color: var(--secondary);
  max-width: 600px;
  margin: 0 auto;
  line-height: 1.8;
}

@media (max-width: 768px) {
  .mcu-grid {
    grid-template-columns: 1fr;
  }

  .intro-title {
    font-size: 28px;
  }

  .intro-subtitle {
    font-size: 16px;
  }
}
</style>

<div class="intro-section">
  <h1 class="intro-title">🦀 支持的 MCU 平台</h1>
  <p class="intro-subtitle">
    跨平台 Rust 嵌入式开发，从入门到实战
  </p>
</div>

<div class="mcu-grid">

  <a href="/stm32/" class="mcu-card">
    <h2 class="mcu-title">STM32</h2>
    <p class="mcu-subtitle">意法半导体 | ARM Cortex-M</p>
    <p class="mcu-desc">
      工业级高性能微控制器，生态成熟，外设丰富，适合复杂项目开发。
    </p>
    <div class="mcu-tags">
      <span class="mcu-tag">F4系列</span>
      <span class="mcu-tag">H7系列</span>
      <span class="mcu-tag">Embassy</span>
    </div>
  </a>

  <a href="/esp32/" class="mcu-card">
    <h2 class="mcu-title">ESP32</h2>
    <p class="mcu-subtitle">乐鑫科技 | RISC-V & Xtensa</p>
    <p class="mcu-desc">
      内置 Wi-Fi 和蓝牙的物联网芯片，低成本高性能，IoT 项目首选。
    </p>
    <div class="mcu-tags">
      <span class="mcu-tag">ESP32-C3</span>
      <span class="mcu-tag">ESP32-C6</span>
      <span class="mcu-tag">Wi-Fi 6</span>
    </div>
  </a>

  <a href="/rp/" class="mcu-card">
    <h2 class="mcu-title">RP2040/2350</h2>
    <p class="mcu-subtitle">树莓派 | ARM Cortex-M0+/M33</p>
    <p class="mcu-desc">
      双核心架构，独特的 PIO 可编程 I/O，创客友好，社区活跃。
    </p>
    <div class="mcu-tags">
      <span class="mcu-tag">Pico</span>
      <span class="mcu-tag">Pico 2</span>
      <span class="mcu-tag">PIO</span>
    </div>
  </a>

  <a href="/py32/" class="mcu-card">
    <h2 class="mcu-title">PY32</h2>
    <p class="mcu-subtitle">普冉半导体 | ARM Cortex-M0+</p>
    <p class="mcu-desc">
      国产低成本微控制器，价格亲民，供应链稳定，适合批量应用。
    </p>
    <div class="mcu-tags">
      <span class="mcu-tag">国产芯片</span>
      <span class="mcu-tag">超低成本</span>
      <span class="mcu-tag">小封装</span>
    </div>
  </a>

</div>

<div style="text-align: center; margin-top: 64px; padding: 32px; background: var(--entry); border-radius: 12px;">
  <h3 style="font-size: 24px; margin-bottom: 16px;">🚀 更多平台即将支持</h3>
  <p style="color: var(--secondary); margin-bottom: 24px;">
    CH32 · nRF · GD32 · HC32 等国产和进口芯片正在规划中...
  </p>
  <a href="/toolchain/" style="display: inline-block; padding: 12px 32px; background: #CE422B; color: white; border-radius: 8px; text-decoration: none; font-weight: 600; transition: all 0.3s ease;">
    📦 开始配置开发环境
  </a>
</div>

<script>
// 添加卡片点击动画
document.querySelectorAll('.mcu-card').forEach(card => {
  card.addEventListener('click', function(e) {
    // 创建涟漪效果
    const ripple = document.createElement('span');
    const rect = this.getBoundingClientRect();
    const size = Math.max(rect.width, rect.height);
    const x = e.clientX - rect.left - size / 2;
    const y = e.clientY - rect.top - size / 2;

    ripple.style.width = ripple.style.height = size + 'px';
    ripple.style.left = x + 'px';
    ripple.style.top = y + 'px';
    ripple.style.position = 'absolute';
    ripple.style.borderRadius = '50%';
    ripple.style.background = 'rgba(206, 66, 43, 0.3)';
    ripple.style.transform = 'scale(0)';
    ripple.style.animation = 'ripple 0.6s ease-out';
    ripple.style.pointerEvents = 'none';

    this.appendChild(ripple);

    setTimeout(() => ripple.remove(), 600);
  });
});

// 添加涟漪动画CSS
const style = document.createElement('style');
style.textContent = `
  @keyframes ripple {
    to {
      transform: scale(2);
      opacity: 0;
    }
  }
`;
document.head.appendChild(style);
</script>
