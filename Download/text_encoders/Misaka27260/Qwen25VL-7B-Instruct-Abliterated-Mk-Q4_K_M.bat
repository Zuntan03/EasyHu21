@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\text_encoders

@REM https://huggingface.co/Misaka27260/Qwen2.5-VL-7B-Instruct-abliterated-GGUF
call %HUGGING_FACE% Misaka27260\ Qwen25VL-7B-Instruct-Abliterated-Mk-Q4_K_M.gguf Misaka27260/Qwen2.5-VL-7B-Instruct-abliterated-GGUF Qwen2.5-VL-7B-Instruct-abliterated-i1-f16o-Q4_K_M.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% Misaka27260\ Qwen25VL-7B-Instruct-Abliterated-Mk-mmproj.gguf Misaka27260/Qwen2.5-VL-7B-Instruct-abliterated-GGUF mmproj-Qwen2.5-VL-7B-Instruct.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\text_encoders
