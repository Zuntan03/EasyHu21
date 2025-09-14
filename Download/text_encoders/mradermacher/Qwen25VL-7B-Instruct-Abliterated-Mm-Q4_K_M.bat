@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\text_encoders

@REM https://huggingface.co/mradermacher/Qwen2.5-VL-7B-Instruct-abliterated-GGUF
call %HUGGING_FACE% mradermacher\ Qwen25VL-7B-Instruct-Abliterated-Mm-Q4_K_M.gguf mradermacher/Qwen2.5-VL-7B-Instruct-abliterated-GGUF Qwen2.5-VL-7B-Instruct-abliterated.Q4_K_M.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% mradermacher\ Qwen25VL-7B-Instruct-Abliterated-Mm-mmproj.gguf mradermacher/Qwen2.5-VL-7B-Instruct-abliterated-GGUF Qwen2.5-VL-7B-Instruct-abliterated.mmproj-Q8_0.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\text_encoders
