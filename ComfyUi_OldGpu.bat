@echo off
chcp 65001 > NUL

call %~dp0ComfyUi_NoArgs.bat --auto-launch %*
@REM --fast --use-sage-attention %*
