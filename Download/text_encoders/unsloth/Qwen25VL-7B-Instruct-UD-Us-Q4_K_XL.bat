@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\text_encoders

@REM https://huggingface.co/unsloth/Qwen2.5-VL-7B-Instruct-GGUF
call %HUGGING_FACE% unsloth\ Qwen25VL-7B-Instruct-UD-Us-Q4_K_XL.gguf unsloth/Qwen2.5-VL-7B-Instruct-GGUF Qwen2.5-VL-7B-Instruct-UD-Q4_K_XL.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% unsloth\ Qwen25VL-7B-Instruct-Us-mmproj-F16.gguf unsloth/Qwen2.5-VL-7B-Instruct-GGUF mmproj-F16.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\text_encoders
