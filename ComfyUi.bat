@echo off
chcp 65001 > NUL

call %~dp0ComfyUi_NoArgs.bat --auto-launch --max-upload-size 500 --fast --use-sage-attention %*
@REM --fast --use-sage-attention %*
