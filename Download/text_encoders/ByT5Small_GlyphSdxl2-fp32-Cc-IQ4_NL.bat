@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\text_encoders

@REM https://huggingface.co/calcuis/pig-encoder
call %HUGGING_FACE% .\ ByT5Small_GlyphSdxl2-fp32-Cc-IQ4_NL.gguf calcuis/pig-encoder byt5_small_glyphxl_fp32-iq4_nl.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\text_encoders
