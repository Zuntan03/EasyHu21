<!-- 英語のルビは easy Hu Nyan One -->
# <ruby>EasyHu21<rt>ｲｰｼﾞﾌﾆｬﾝﾜﾝ</rt></ruby>

実験的で工事中です。

[English README](README_en.md)

[HunyuanImage-2.1](https://github.com/Tencent-Hunyuan/HunyuanImage-2.1) を簡単に試せる環境です。  
最近の NVIDIA GPU を搭載した Windows PC が必要です。

## インストール

1. [EasyHu21Installer.bat](https://github.com/Zuntan03/EasyHu21/raw/main/EasyHu21/EasyHu21Installer.bat?ver=0) を右クリックから保存します。
	- デフォルトでは [ComfyUI 公式が推奨している Python 3.12](https://github.com/comfyanonymous/ComfyUI#manual-install-windows-linux) を使用します。  
	[EasyHu21Installer-Python3_10.bat](https://github.com/Zuntan03/EasyHu21/raw/main/EasyHu21/EasyHu21Installer-Python3_10.bat?ver=0) でインストールすると Python 3.10 系を利用できます。
		- Python 3.10 でないと動作しない環境があるようです。  
		インストールや起動に失敗する場合は、Python 3.10 系でのインストールを試してみてください。
2. インストール先の **空フォルダ** を `C:/EasyHu21/` や `D:/EasyHu21/` などの浅いパスに用意して、`EasyHu21Installer.bat` を置いて実行します。
	- **`発行元を確認できませんでした。このソフトウェアを実行しますか？` と表示されたら `実行` します。**
	- **`WindowsによってPCが保護されました` と表示されたら、`詳細表示` から `実行` します。**
	- **`Microsoft Visual C++ 2015-2022 Redistributable` のインストールで `このアプリがデバイスに変更を加えることを許可しますか？` と表示されたら `はい` とします。**
	<!-- - **必要なファイルのダウンロードに [Civitai](https://civitai.com/) API キーが必要ですので、画面の案内や [ネット上のノウハウ](https://www.google.com/search?q=civitai+api+key) に沿って入力してください。** -->

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
		- VRAM 不足が起こらない範囲で、低い値を設定します。必要以上に高い値を設定すると、GPU の稼働率が下がります。
	- 初回の生成は初期化で時間が掛かります。生成時間を確認するには、続けて 2枚目を生成してみてください。

ワークフロー上部の赤いノードで、PC のスペックに合わせて高速化できます。
- `VirtualVram` を VRAM 不足にならない範囲で減らします。
- VAE のエンコードやデコードで VRAM 不足にならないなら、`TiledVae` を無効にできます。
- Geforce RTX 30x0 以上なら、`TorchCompile` を有効にできます。初回実行のみ時間が掛かります。

- `Update.bat` で更新します。
	- 更新時のファイルの自動ダウンロードは `EasyHu21/AutoDownload_(Enable|Disable).bat` で切り替えられます。  
	ただし、無効にすると `Easy/*` の更新されたワークフローが正常に動作しなくなる場合があります。

## 最近の更新履歴

<!-- [更新履歴](https://github.com/Zuntan03/EasyHu21/wiki/ChangeLog) -->

<!--
README.md を英訳して README_en.md を更新します。更新履歴をよく更新します。EasyHu21/wiki/ へのリンクは変更禁止。「ドキュメント」内は変更禁止。
-->

現在、ドキュメントの更新が追いついていません。

### 2025/09/15

- リポジトリを公開。

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。  
別途ライセンスファイルがあるフォルダ以下は、そのライセンスです。
