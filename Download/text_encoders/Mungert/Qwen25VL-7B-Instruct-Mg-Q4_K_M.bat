@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\text_encoders

@REM https://huggingface.co/Mungert/Qwen2.5-VL-7B-Instruct-GGUF
call %HUGGING_FACE% Mungert\ Qwen25VL-7B-Instruct-Mg-Q4_K_M.gguf Mungert/Qwen2.5-VL-7B-Instruct-GGUF Qwen2.5-VL-7B-Instruct-q4_k_m.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% Mungert\ Qwen25VL-7B-Instruct-Mg-mmproj-F16.gguf Mungert/Qwen2.5-VL-7B-Instruct-GGUF Qwen2.5-VL-7B-Instruct-mmproj-f16.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\text_encoders
