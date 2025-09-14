@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\text_encoders

@REM https://huggingface.co/Comfy-Org/HunyuanImage_2.1_ComfyUI
call %HUGGING_FACE% .\ Qwen25VL-7B-fp8_scaled.safetensors Comfy-Org/HunyuanImage_2.1_ComfyUI split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\text_encoders
