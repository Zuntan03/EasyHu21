@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\vae

@REM https://huggingface.co/calcuis/pig-vae
call %HUGGING_FACE% .\ Pig_HunyuanImageVae-fp32-Cc-F16.gguf calcuis/pig-vae pig_hunyuan_image_vae_fp32-f16.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\vae
