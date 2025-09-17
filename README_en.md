<!-- Ruby for English is Easy Hu Nyan One -->
# <ruby>EasyHu21<rt>Easy Hu Nyan One</rt></ruby>

This is an experimental environment.

[日本語 README](README.md)

An environment for easily trying [HunyuanImage-2.1](https://github.com/Tencent-Hunyuan/HunyuanImage-2.1).  
Requires a Windows PC equipped with recent NVIDIA GPUs.

With VRAM 12GB GeForce RTX 3060 12GB and RAM 64GB, generates HunyuanImage-2.1 standard size images (2304x1792, equivalent to 2 Full HD images) in about 70 seconds.  
While not a recommended environment, with VRAM 6GB GeForce GTX 1660Ti and RAM 16GB, generates Full HD images in about 7 minutes.

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyHu21/log/2509/GeforceGtx1660Ti.webp)

## Installation

1. Right-click on the link [EasyHu21Installer.bat](https://github.com/Zuntan03/EasyHu21/raw/main/EasyHu21/EasyHu21Installer.bat?ver=0) itself without opening it, and select `Save link as`.
	- If you open the link first and then right-click to save, it will become a `txt` file instead of a `bat` file and won't be executable.
<!--
	- By default, this uses [Python 3.12 as recommended by the official ComfyUI](https://github.com/comfyanonymous/ComfyUI#manual-install-windows-linux).  
	If you install with [EasyHu21Installer-Python3_10.bat](https://github.com/Zuntan03/EasyHu21/raw/main/EasyHu21/EasyHu21Installer-Python3_10.bat?ver=0), you can use Python 3.10 series.
		- Some environments may only work with Python 3.10.  
		If installation or startup fails, try installing with Python 3.10 series.
-->
2. Prepare an **empty folder** at a shallow path like `C:/EasyHu21/` or `D:/EasyHu21/` as the installation destination, place `EasyHu21Installer.bat` there, and execute it.
	- **If prompted with `Publisher could not be verified. Do you want to run this software?`, click `Run`.**
	- **If prompted with `Windows protected your PC`, click `More info` then `Run anyway`.**
	- **If prompted with `Do you want to allow this app to make changes to your device?` during `Microsoft Visual C++ 2015-2022 Redistributable` installation, click `Yes`.**
	<!-- - **A [Civitai](https://civitai.com/) API key is required to download necessary files, so please enter it following the on-screen instructions and [online tutorials](https://www.google.com/search?q=civitai+api+key).** -->

### Installation Troubleshooting

While installation succeeds in some environments, it appears to fail in specific environments.  
If errors are displayed in the black command line screen, could you please share those error messages?

Observed symptoms and investigation/resolution status:

1. ~~Prompted to install C++ build tools.~~
	- ~~Information suggests this occurs during installation of [ComfyUI_essentials](https://github.com/cubiq/ComfyUI_essentials) [requirements.txt](https://github.com/cubiq/ComfyUI_essentials/blob/main/requirements.txt). Mysterious.~~
		- Modified to explicitly install packages required by [ComfyUI_essentials](https://github.com/cubiq/ComfyUI_essentials) [requirements.txt](https://github.com/cubiq/ComfyUI_essentials/blob/main/requirements.txt) in advance using versions that work on our local environment.
	- ~~[SageAttention v2.2.0-windows.post2](https://github.com/woct0rdho/SageAttention/releases/tag/v2.2.0-windows.post2) is suspicious.~~  
	~~In EasyWan22, there were reports of environments that didn't work unless upgraded from post1 to post2.~~  
	- ~~Should we temporarily downgrade to torch 2.7.1 like EasyWan22?~~
2. ~~Doesn't work unless llama-cpp-python is reinstalled.~~
	- ~~Seems like llama-cpp-python CUDA version installation is needed, similar to EasyReforce? Will try this.~~
	- CUDA version llama-cpp-python installation is now supported.
3. ~~Command prompt doesn't launch when executing the installer bat file.~~
	- ~~There was a case where it worked when saving the file content directly in a text editor instead of right-clicking to save. Need to recheck character encoding and other factors.~~
	- The issue of bat files becoming txt files when saving after opening the link seems to be the trap, so we've updated the installation instructions to avoid confusion.

We're working on solutions with available information, and will address issues as new information and solutions become available.

## Usage

1. Launch with `ComfyUi.bat`.
	- **[ Warning ][ ComfyUI Trap ][ Many Victims ]  
	On first startup, old workflows from browser cache may open and cause errors.  
	Please ignore the errors and close the workflows.**
	- For GPUs prior to GeForce RTX 20x0, launch with `ComfyUi_OldGpu.bat`.
2. **After launching `ComfyUI.bat`, open the `Hu21/00-TextToImage` workflow and click `Queue Prompt` to generate images.**  
Then click `Queue Prompt` as-is to generate videos.
	- **If VRAM is less than 12GB, please adjust the red `VirtualVram` setting in the upper left.**
		- For 8GB VRAM use `7`, for 6GB use `9`.
		- For 16GB or more VRAM, set to `0`.
		- Set the lowest value that doesn't cause VRAM shortage.  
		Setting unnecessarily high values seems to reduce GPU utilization.
	- If VAE encoding/decoding causes VRAM shortage, please reduce the image generation size.  
		- GeForce GTX 1660Ti with 6GB VRAM was able to decode Full HD (1920x1088).
		- Switching to `TiledVae` is supported, but may leave stripe patterns in the image.
			- If `TiledVae` works properly, standard size 2048x2048 can be generated with 6GB VRAM.
	- Initial generation takes time for initialization.  
	To check generation time, try generating a second image.

You can optimize for speed using the red nodes at the top of the workflow according to your PC specs.
- Reduce `VirtualVram` to the lowest value that doesn't cause VRAM shortage.
- For GeForce RTX 30x0 and above, you can enable `TorchCompile`. The first execution takes extra time for compilation.

Update with `Update.bat`.
- Automatic file downloads during updates can be toggled with `EasyHu21/AutoDownload_(Enable|Disable).bat`.  
	However, disabling this may cause updated workflows in `Easy/*` to not work properly.

## Recent Update History

<!-- [Update History](https://github.com/Zuntan03/EasyHu21/wiki/ChangeLog) -->

<!--
README.md を英訳して README_en.md を更新します。更新履歴をよく更新します。EasyHu21/wiki/ へのリンクは変更禁止。「ドキュメント」内は変更禁止。
-->

Currently, documentation updates are not keeping up.

### 2025/09/17

- Added additional measures to address issues where [ComfyUI_essentials](https://github.com/cubiq/ComfyUI_essentials) installation causes errors in specific environments.
- Changed installer to support only Python 3.10 series, as Python 3.12 series requires compilers in specific environments.

### 2025/09/15

- Repository made public.
- Added information about issues that may occur in specific environments to the Installation Troubleshooting section in README.
- Fixed installation instructions for saving `bat` files to prevent potential confusion.
- Added support for CUDA version llama-cpp-python installation.
- Modified to explicitly install packages required by [ComfyUI_essentials](https://github.com/cubiq/ComfyUI_essentials) [requirements.txt](https://github.com/cubiq/ComfyUI_essentials/blob/main/requirements.txt) in advance using working versions, as some environments experience errors during installation.

## License

The contents of this repository are under [MIT License](./LICENSE.txt).  
Folders with separate license files are under those respective licenses.