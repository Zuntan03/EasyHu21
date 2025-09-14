<!-- Ruby for English is easy Hu Nyan One -->
# <ruby>EasyHu21<rt>Easy Hu Nyan One</rt></ruby>

This is experimental and under construction.

[日本語 README](README.md)

An environment for easily trying [HunyuanImage-2.1](https://github.com/Tencent-Hunyuan/HunyuanImage-2.1).  
Requires a Windows PC equipped with recent NVIDIA GPUs.

## Installation

1. Right-click and save [EasyHu21Installer.bat](https://github.com/Zuntan03/EasyHu21/raw/main/EasyHu21/EasyHu21Installer.bat?ver=0).
	- By default, this uses [Python 3.12 as recommended by the official ComfyUI](https://github.com/comfyanonymous/ComfyUI#manual-install-windows-linux).  
	If you install with [EasyHu21Installer-Python3_10.bat](https://github.com/Zuntan03/EasyHu21/raw/main/EasyHu21/EasyHu21Installer-Python3_10.bat?ver=0), you can use Python 3.10 series.
		- Some environments may only work with Python 3.10.  
		If installation or startup fails, try installing with Python 3.10 series.
2. Prepare an **empty folder** at a shallow path like `C:/EasyHu21/` or `D:/EasyHu21/` as the installation destination, place `EasyHu21Installer.bat` there, and execute it.
	- **If prompted with `Publisher could not be verified. Do you want to run this software?`, click `Run`.**
	- **If prompted with `Windows protected your PC`, click `More info` then `Run anyway`.**
	- **If prompted with `Do you want to allow this app to make changes to your device?` during `Microsoft Visual C++ 2015-2022 Redistributable` installation, click `Yes`.**
	<!-- - **A [Civitai](https://civitai.com/) API key is required to download necessary files, so please enter it following the on-screen instructions and [online tutorials](https://www.google.com/search?q=civitai+api+key).** -->

## Usage

1. Launch with `ComfyUi.bat`.
	- **[ Warning ][ ComfyUI Trap ][ Many Victims ]  
	On first startup, old workflows from browser cache may open and cause errors.  
	Please ignore the errors and close the workflows.**
	- For GPUs prior to GeForce RTX 20x0, launch with `ComfyUi_OldGpu.bat`.
2. **After launching `ComfyUI.bat`, open the `Easy/00-TextToImage` workflow and click `Queue Prompt` to generate images.**  
Then click `Queue Prompt` as-is to generate videos.
	- **If VRAM is less than 12GB, please adjust the red `VirtualVram` setting in the upper left.**
		- For 8GB VRAM use `7`, for 6GB use `9`.
		- For 16GB or more VRAM, set to `0`.
	- Initial generation takes time for initialization. To check generation time, try generating a second image.

- Update with `Update.bat`.
	- Automatic file downloads during updates can be toggled with `EasyHu21/AutoDownload_(Enable|Disable).bat`.  
	However, disabling this may cause updated workflows in `Easy/*` to not work properly.

## Recent Update History

<!-- [Update History](https://github.com/Zuntan03/EasyHu21/wiki/ChangeLog) -->

<!--
README.md を英訳して README_en.md を更新します。更新履歴をよく更新します。EasyHu21/wiki/ へのリンクは変更禁止。「ドキュメント」内は変更禁止。
-->

Currently, documentation updates are not keeping up.

### 2025/09/15

- Repository made public.

## License

The contents of this repository are under [MIT License](./LICENSE.txt).  
Folders with separate license files are under those respective licenses.