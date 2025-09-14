@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\vae

@REM https://huggingface.co/Comfy-Org/HunyuanImage_2.1_ComfyUI
call %HUGGING_FACE% .\ HunyuanImageRefinerVae-fp16.safetensors Comfy-Org/HunyuanImage_2.1_ComfyUI split_files/vae/hunyuan_image_refiner_vae_fp16.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\vae
