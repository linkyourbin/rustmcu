@echo off
REM RUST MCU 博客本地预览脚本

echo ======================================
echo    RUST MCU 博客 - 本地预览
echo ======================================
echo.
echo 正在启动 Hugo 开发服务器...
echo.
echo 预览地址: http://localhost:1313
echo.
echo 按 Ctrl+C 停止服务器
echo ======================================
echo.

hugo server -D --bind 0.0.0.0

pause
