@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\text_encoders

@REM https://huggingface.co/calcuis/hunyuanimage-gguf
call %HUGGING_FACE% .\ Qwen25VL-7B-Cc-Q4_0.gguf calcuis/hunyuanimage-gguf qwen2.5-vl-7b-test-q4_0.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\text_encoders
