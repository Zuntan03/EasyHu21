<!-- 英語のルビは Easy Hu Nyan One -->
# <ruby>EasyHu21<rt>ｲｰｼﾞｰ ﾌﾆｬﾝﾜﾝ</rt></ruby>

実験的な環境です。

私の実験結果

- LoRA 学習も含め、Geforce RTX 3060 12GB で実用できそうな感触です。
- いわゆる覇権モデル（NSFW 対応の OrangeMix, Animagine, Pony, Noob, Illustrious など）の登場待ちになりそうです。
	- Qwen-Image か、HunyuanImage か、その他か、楽しみですね。

[English README](README_en.md)

[HunyuanImage-2.1](https://github.com/Tencent-Hunyuan/HunyuanImage-2.1) を簡単に試せる環境です。  
最近の NVIDIA GPU を搭載した Windows PC が必要です。

VRAM 12GB の Geforce RTX 3060 12GB, RAM 64GB で、HunyuanImage-2.1 の標準サイズ画像 (2304x1792, FullHD 2枚分) を 70秒程度で生成します。  
推奨できる環境ではありませんが、VRAM 6GB の Geforce GTX 1660Ti, RAM 16GB で FullHD 画像を 7分程度で生成します。

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyHu21/log/2509/GeforceGtx1660Ti.webp)

## インストール

1. [EasyHu21Installer.bat](https://github.com/Zuntan03/EasyHu21/raw/main/EasyHu21/EasyHu21Installer.bat?ver=0) をリンクを開かずに、リンク自体を右クリックして `名前をつけてリンク先を保存` します。
	- リンクを開いてから右クリックから保存すると、`*.bat` ファイルでなく `*.txt` ファイルになり実行できなくなります。
2. インストール先の **空フォルダ** を `C:/EasyHu21/` や `D:/EasyHu21/` などの浅いパスに用意して、`EasyHu21Installer.bat` を置いて実行します。
	- **`発行元を確認できませんでした。このソフトウェアを実行しますか？` と表示されたら `実行` します。**
	- **`WindowsによってPCが保護されました` と表示されたら、`詳細表示` から `実行` します。**
	- **`Microsoft Visual C++ 2015-2022 Redistributable` のインストールで `このアプリがデバイスに変更を加えることを許可しますか？` と表示されたら `はい` とします。**

## 使い方

1. `ComfyUi.bat` で起動します。
	- **[ 注意 ][ ComfyUI の罠 ][ 被害者多め ]  
	初回起動時にブラウザキャッシュにある過去のワークフローが開かれ、エラーになる場合があります。  
	エラーを無視してワークフローを閉じてください。**
	- Geforce RTX 20x0 以前の GPU の場合は、`ComfyUi_OldGpu.bat` で起動します。
2. **`ComfyUI.bat` を起動したら `Hu21/00-TextToImage` ワークフローを開いて `実行する` で画像を生成します。**  
そのまま `実行する` で動画を生成します。
	- **VRAM が 12GB 未満の場合は、左上の赤い `VirtualVram` を調整してください。**
		- VRAM 8GB なら `7`、6GB なら `9` です。
		- VRAM が 16GB 以上なら `0` にします。
		- VRAM 不足が起こらない範囲で、低い値を設定します。  
		必要以上に高い値を設定すると、GPU の稼働率が下がるようです。
	- Geforce RTX 50x0 で `CUDA Error` が発生する場合は、コンソールを閉じて ComfyUI を終了し、`EasyHu21\LlamaCppPython_GeforcrRTX50x0-Enable.bat` を実行してから `ComfyUI.bat` を再度起動してください。
	- VAE のエンコードやデコードで VRAM 不足にならなる場合は、生成する画像のサイズを減らしてください。  
		- VRAM 6GB の Geforce GTX 1660Ti で FullHD(1920x1088) をデコードできました。
		- `TiledVae` への切り替えに対応していますが、画像に縞模様が残ります。
			- `TiledVae` が正常に動作すれば、VRAM 6GB で標準サイズの 2048x2048 を生成できます。
	- 初回の生成は初期化で時間が掛かります。  
	生成時間を確認するには、続けて 2枚目を生成してみてください。

ワークフロー上部の赤いノードで、PC のスペックに合わせて高速化できます。
- `VirtualVram` を VRAM 不足にならない範囲で減らします。
- Geforce RTX 30x0 以上なら、`TorchCompile` を有効にできます。初回実行ではコンパイルで時間が掛かります。

`Update.bat` で更新します。
- 更新時のファイルの自動ダウンロードは `EasyHu21/AutoDownload_(Enable|Disable).bat` で切り替えられます。  
	ただし、無効にすると `Easy/*` の更新されたワークフローが正常に動作しなくなる場合があります。

## 最近の更新履歴

<!-- [更新履歴](https://github.com/Zuntan03/EasyHu21/wiki/ChangeLog) -->

<!--
README.md を英訳して README_en.md を更新します。更新履歴をよく更新します。EasyHu21/wiki/ へのリンクは変更禁止。「ドキュメント」内は変更禁止。
-->

### 2025/09/20

- PyTorch のバージョンを安定動作に実績のあるバージョンに変更しました。
	- `torch==2.7.1+cu2.8.0`
- SageAttention をコマンドラインオプションから削除しました。
	- ノードで有効にするか、`ComfyUi.bat` を別名コピーして、引数に `--use-sage-attention` を追加します。

### 2025/09/18

- `huggingface_hub[hf_xet]` をインストールするようにしました。
- Geforce RTX 50x0 用の `llama-cpp-python` をインストールする `EasyHu21\LlamaCppPython_GeforcrRTX50x0-Enable.bat` を追加しました。
	- llama-cpp-python で CUDA Error が発生する場合にお試しください。
	- 古いビデオカードでは逆に動作しなくなる場合がありますが、`EasyHu21\LlamaCppPython_GeforcrRTX50x0-Disable.bat` で元に戻せます。

### 2025/09/17

- [ComfyUI_essentials](https://github.com/cubiq/ComfyUI_essentials) のインストールで、特定の環境でエラーが発生する問題への追加の対処を入れてみました。
- Python 3.12 系では特定の環境でコンパイラを要求されてるため、インストーラを Python 3.10 系対応のみにしました。
- ~~llama_cpp_python を Geforce RTX 50x0 対応版に変更しました。~~
	- 動作していた一応環境で動作しなくなったので、巻き戻し。

### 2025/09/15

- リポジトリを公開。
- 特定の環境で発生していると思われる問題について、README の インストールのトラブル状況 に記載。
- インストール時の `bat` の保存方法について、トラブルになりそうな説明を修正しました。
- CUDA 版 llama_cpp_python のインストールに対応しました。
- [ComfyUI_essentials](https://github.com/cubiq/ComfyUI_essentials) の [requirements.txt](https://github.com/cubiq/ComfyUI_essentials/blob/main/requirements.txt) インストールでエラーが発生する環境があるため、手元で動作しているバージョンを先行して明示的にインストールするようにしました。

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。  
別途ライセンスファイルがあるフォルダ以下は、そのライセンスです。
