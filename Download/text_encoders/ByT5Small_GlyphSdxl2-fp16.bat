@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\text_encoders

@REM https://huggingface.co/Comfy-Org/HunyuanImage_2.1_ComfyUI
call %HUGGING_FACE% .\ ByT5Small_GlyphSdxl2-fp16.safetensors Comfy-Org/HunyuanImage_2.1_ComfyUI split_files/text_encoders/byt5_small_glyphxl_fp16.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\text_encoders
