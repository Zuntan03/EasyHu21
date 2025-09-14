@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\diffusion_models

@REM https://huggingface.co/calcuis/hunyuanimage-gguf
call %HUGGING_FACE% Hu21\ HunyuanImage21_Refiner-Cc-IQ4_NL.gguf calcuis/hunyuanimage-gguf hunyuanimage-refiner-v2-iq4_nl.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\diffusion_models
