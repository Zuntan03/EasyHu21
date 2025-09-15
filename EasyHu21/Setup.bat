@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\EasyTools
set EASY_COMFYUI=%EASY_TOOLS%\ComfyUi
set GITHUB_CLONE_OR_PULL_HASH=%EASY_TOOLS%\Git\GitHub_CloneOrPull_Hash.bat
set GITHUB_CLONE_OR_PULL_TAG=%EASY_TOOLS%\Git\GitHub_CloneOrPull_Tag.bat
set JUNCTION=%EASY_TOOLS%\Link\JunctionNoReLink.bat
set CURL_CMD=C:\Windows\System32\curl.exe -kL

pushd "%~dp0.."

if exist "%~dp0ComfyUi-VersionUnlock.txt" ( goto :SKIP_COMFYUI_VERSION_LOCK )

@REM https://github.com/comfyanonymous/ComfyUI/releases
@REM https://github.com/comfyanonymous/ComfyUI/commits/master/
@REM echo v0.3.59> "%EASY_COMFYUI%\ComfyUi_Version.txt"
copy NUL "%EASY_COMFYUI%\ComfyUi_Version.txt" > NUL

@REM https://github.com/Comfy-Org/ComfyUI-Manager/tags
@REM echo 3.35> "%EASY_COMFYUI%\ComfyUiManager_Version.txt"
copy NUL "%EASY_COMFYUI%\ComfyUiManager_Version.txt" > NUL

:SKIP_COMFYUI_VERSION_LOCK

if exist "%~dp0Pytorch-VersionUnlock.txt" ( goto :SKIP_PYTORCH_VERSION_LOCK )

echo xformers> "%EASY_COMFYUI%\UninstallModule.txt"

@REM https://pytorch.org/get-started/locally/
echo torch==2.8.0+cu129 torchvision==0.23.0+cu129 torchaudio==2.8.0+cu129 --index-url https://download.pytorch.org/whl/cu129> "%EASY_COMFYUI%\Torch_Version.txt"


@REM https://github.com/woct0rdho/triton-windows/releases v3.4.x PyTorch >= 2.8
echo triton-windows==3.4.0.post20> "%EASY_COMFYUI%\Triton_Version.txt"

@REM https://github.com/woct0rdho/SageAttention/releases
@REM cu128 != cu129 compatibility
echo https://github.com/woct0rdho/SageAttention/releases/download/v2.2.0-windows.post2/sageattention-2.2.0+cu128torch2.8.0.post2-cp39-abi3-win_amd64.whl> "%EASY_COMFYUI%\SageAttention_Version.txt"

:SKIP_PYTORCH_VERSION_LOCK

call %EASY_TOOLS%\ComfyUi\ComfyUi_Update.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM ComfyUI-Impact-Pack\requirements.txt
echo pip install -qq numpy==1.26.4 opencv-python-headless==4.11.0.86 opencv-contrib-python==4.11.0.86 opencv-python==4.11.0.86
pip install -qq numpy==1.26.4 opencv-python-headless==4.11.0.86 opencv-contrib-python==4.11.0.86 opencv-python==4.11.0.86
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM WanVideoPromptExtender Qwen
@REM https://github.com/kijai/ComfyUI-Florence2/issues/134
@REM https://github.com/huggingface/transformers/issues/36886
echo pip install -qq transformers==4.49.0
pip install -qq transformers==4.49.0
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://github.com/Zuntan03/EasyWan22/issues/1 python 3.12.x
echo pip install -qq PyYAML==6.0.2
pip install -qq PyYAML==6.0.2
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM https://files.catbox.moe/pqzrbx.png
@REM https://github.com/cubiq/ComfyUI_essentials/blob/main/requirements.txt
echo pip install -qq numba==0.61.2 colour-science==0.4.6 rembg==2.0.67 pixeloe==0.1.4 transparent-background==1.3.4
pip install -qq numba==0.61.2 colour-science==0.4.6 rembg==2.0.67 pixeloe==0.1.4 transparent-background==1.3.4

if "%EASY_PYTHON_VERSION_3%"=="310" (
	goto :EASY_PYTHON_310_MODULES
) else if "%EASY_PYTHON_VERSION_3%"=="312" (
	goto :EASY_PYTHON_312_MODULES
) else (
	echo ERROR: Invalid Python version. EASY_PYTHON_VERSION_3: %EASY_PYTHON_VERSION_3%
	pause
	goto :EASY_PYTHON_MODULES_END
)
:EASY_PYTHON_310_MODULES

echo pip install -qq https://github.com/abetlen/llama-cpp-python/releases/download/v0.3.4-cu124/llama_cpp_python-0.3.4-cp310-cp310-win_amd64.whl
pip install -qq https://github.com/abetlen/llama-cpp-python/releases/download/v0.3.4-cu124/llama_cpp_python-0.3.4-cp310-cp310-win_amd64.whl
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

goto :EASY_PYTHON_MODULES_END
:EASY_PYTHON_312_MODULES

echo pip install -qq https://github.com/abetlen/llama-cpp-python/releases/download/v0.3.4-cu124/llama_cpp_python-0.3.4-cp312-cp312-win_amd64.whl
pip install -qq https://github.com/abetlen/llama-cpp-python/releases/download/v0.3.4-cu124/llama_cpp_python-0.3.4-cp312-cp312-win_amd64.whl
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

:EASY_PYTHON_MODULES_END

popd rem "%~dp0.."
pushd "%~dp0..\ComfyUI\custom_nodes"

@REM REMBG: pip UnicodeDecodeError: 'cp932' codec can't decode byte 0x97 in position 2879: illegal multibyte sequence
set PYTHONUTF8=1

@REM https://github.com/crystian/ComfyUI-Crystools/commits/main/
@REM 08/17 2af9ccf0a29c6910e6fcbdd7d2fe96f9bde44eed
call :GITHUB_HASH_REQUIREMENTS crystian ComfyUI-Crystools main 2af9ccf0a29c6910e6fcbdd7d2fe96f9bde44eed
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/pythongosssss/ComfyUI-Custom-Scripts/commits/main/
@REM 08/10 f2838ed5e59de4d73cde5c98354b87a8d3200190
call :GITHUB_HASH_REQUIREMENTS pythongosssss ComfyUI-Custom-Scripts main f2838ed5e59de4d73cde5c98354b87a8d3200190
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM 09/11 ebac117522fe7ecfe08d1bc30ece3102a53a3247
@REM https://github.com/AlekPet/ComfyUI_Custom_Nodes_AlekPet/commits/master/
call :GITHUB_HASH_REQUIREMENTS AlekPet ComfyUI_Custom_Nodes_AlekPet master ebac117522fe7ecfe08d1bc30ece3102a53a3247
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/cubiq/ComfyUI_essentials/commits/main/
call :GITHUB_HASH_REQUIREMENTS cubiq ComfyUI_essentials main 9d9f4bedfc9f0321c19faf71855e228c93bd0dc9
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-Florence2/commits/main/
@REM 08/09 00b63382966a444a9fefacb65b8deb188d12a458
@REM call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-Florence2 main 00b63382966a444a9fefacb65b8deb188d12a458
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/city96/ComfyUI-GGUF/commits/main/
@REM 09/08 6b778afdc938427116cb72e683d28e42baf67082
@REM 09/15 be2a08330d7ec232d684e50ab938870d7529471e
call :GITHUB_HASH_REQUIREMENTS city96 ComfyUI-GGUF main be2a08330d7ec232d684e50ab938870d7529471e
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/ltdrdata/ComfyUI-Impact-Pack/tags
call :GITHUB_TAG_REQUIREMENTS ltdrdata ComfyUI-Impact-Pack Main 8.21.2
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/ltdrdata/ComfyUI-Impact-Subpack/tags
call :GITHUB_TAG_REQUIREMENTS ltdrdata ComfyUI-Impact-Subpack main 1.3.4
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist ..\models\ultralytics\ ( mkdir ..\models\ultralytics )

@REM https://github.com/kijai/ComfyUI-KJNodes/commits/main/
@REM 09/02 0adab07d1ad3d0780afc97319eaf37c3681af37d
@REM 09/08 36f6fdd7d4c393675ac622bd300ef667ee65d8b8
@REM 09/14 468fcc86f0b29e79a8510e8239eb15714d6747a6
call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-KJNodes main 468fcc86f0b29e79a8510e8239eb15714d6747a6
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist ComfyUI-KJNodes\fonts\f910-shin-comic-2.04.otf (
	copy %~dp0f910-shin-comic-2.04\f910-shin-comic-2.04.otf ComfyUI-KJNodes\fonts\
)

@REM https://github.com/pollockjj/ComfyUI-MultiGPU/commits/main/
@REM 09/13 d34a32f0973d243b152c271d9dff57ce7ff87ec1
@REM 09/15 80f8a14dea5f77ac9546576c96da79d730773c65
call :GITHUB_HASH_REQUIREMENTS pollockjj ComfyUI-MultiGPU main 80f8a14dea5f77ac9546576c96da79d730773c65
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/Smirnov75/ComfyUI-mxToolkit/commits/main/
call :GITHUB_HASH_REQUIREMENTS Smirnov75 ComfyUI-mxToolkit main 7f7a0e584f12078a1c589645d866ae96bad0cc35
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/1038lab/ComfyUI-RMBG/commits/main/
@REM 08/19 ff0af696a69cfb27ea2a98509d0f57e762200978
@REM 09/13 d38178a5639b5b0ccec4124d7652a8b2594df2db
call :GITHUB_HASH_REQUIREMENTS 1038lab ComfyUI-RMBG main d38178a5639b5b0ccec4124d7652a8b2594df2db
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/kijai/ComfyUI-segment-anything-2/commits/main/
call :GITHUB_HASH_REQUIREMENTS kijai ComfyUI-segment-anything-2 main c59676b008a76237002926f684d0ca3a9b29ac54
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/SeanScripts/ComfyUI-Unload-Model/commits/main/
@REM call :GITHUB_HASH_REQUIREMENTS SeanScripts ComfyUI-Unload-Model main ac5ffb4ed05546545ce7cf38e7b69b5152714eed
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/calcuis/gguf/commits/main/
call :GITHUB_HASH_REQUIREMENTS calcuis gguf main 4f46d348378474dc3acefc08cb910ceded06bf60
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/rgthree/rgthree-comfy/commits/main/
@REM 09/07 26988df02c7e84d0fe22908ad0955fc8797796f6
@REM 09/10 0fb1e239a903e93ef626a8c20589b38f46e39dff
call :GITHUB_HASH_REQUIREMENTS rgthree rgthree-comfy main 0fb1e239a903e93ef626a8c20589b38f46e39dff
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )


@REM https://github.com/KohakuBlueleaf/z-tipo-extension/commits/main/
call :GITHUB_HASH_REQUIREMENTS KohakuBlueleaf z-tipo-extension main 6c6bd9f40bca42f9bbab8b1e7a2ba51cb0d5424b
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )


popd rem "%~dp0..\ComfyUI\custom_nodes"
pushd "%~dp0..\ComfyUI"

if not exist input\Load ( mkdir input\Load )

call %JUNCTION% ..\Input input
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %JUNCTION% ..\Output output
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %JUNCTION% ..\Model models
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist user\default\workflows\ ( mkdir user\default\workflows )
call %JUNCTION% ..\Workflow user\default\workflows
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %JUNCTION% user\default\workflows\Hu21 %~dp0Workflow
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM echo xcopy /SQY %~dp0ComfyUI\*.* .\
@REM xcopy /SQY %~dp0ComfyUI\*.* .\
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem "%~dp0..\ComfyUI"

if not exist %~dp0AutoDownload.txt ( exit /b 0 )
call %~dp0..\Download\Default.bat
@REM call %~dp0..\Sample\_Download.bat
exit /b 0

:MOVE_TO_BACKUP
set "SRC_DIR=%1"
if not exist %SRC_DIR% ( exit /b 0 )

if not exist ..\custom_nodes-backup\ (
	echo mkdir ..\custom_nodes-backup
	mkdir ..\custom_nodes-backup
)

set "DST_DIR=..\custom_nodes-backup\%~nx1"
if exist %DST_DIR%\ (
	echo rmdir /S /Q %DST_DIR%
    rmdir /S /Q %DST_DIR%
)

echo move /Y %SRC_DIR% %DST_DIR%
move /Y %SRC_DIR% %DST_DIR%
exit /b 0


:GITHUB_HASH_REQUIREMENTS
set "GITHUB_AUTHOR=%1"
set "GITHUB_REPO=%2"
set "GITHUB_BRANCH=%3"
set "GITHUB_HASH=%4"

call %GITHUB_CLONE_OR_PULL_HASH% %GITHUB_AUTHOR% %GITHUB_REPO% %GITHUB_BRANCH% %GITHUB_HASH%
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if exist %GITHUB_REPO%\requirements.txt (
	setlocal enabledelayedexpansion
	echo pip install -qq -r %GITHUB_REPO%\requirements.txt
	pip install -qq -r %GITHUB_REPO%\requirements.txt
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )
	endlocal
)
exit /b 0


:GITHUB_TAG_REQUIREMENTS
set "GITHUB_AUTHOR=%1"
set "GITHUB_REPO=%2"
set "GITHUB_BRANCH=%3"
set "GITHUB_TAG=%4"

call %GITHUB_CLONE_OR_PULL_TAG% %GITHUB_AUTHOR% %GITHUB_REPO% %GITHUB_BRANCH% %GITHUB_TAG%
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if exist %GITHUB_REPO%\requirements.txt (
	setlocal enabledelayedexpansion
	echo pip install -qq -r %GITHUB_REPO%\requirements.txt
	pip install -qq -r %GITHUB_REPO%\requirements.txt
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )
	endlocal
)
exit /b 0
