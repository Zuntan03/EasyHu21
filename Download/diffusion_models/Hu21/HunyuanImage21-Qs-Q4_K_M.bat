@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\diffusion_models

@REM https://huggingface.co/QuantStack/HunyuanImage-2.1-GGUF
call %HUGGING_FACE% Hu21\ HunyuanImage21-Qs-Q4_K_M.gguf QuantStack/HunyuanImage-2.1-GGUF HunyuanImage2.1-Q4_K_M.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\diffusion_models
