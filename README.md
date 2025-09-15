<!-- 英語のルビは Easy Hu Nyan One -->
# <ruby>EasyHu21<rt>ｲｰｼﾞｰ ﾌﾆｬﾝﾜﾝ</rt></ruby>

実験的な環境です。

[English README](README_en.md)

[HunyuanImage-2.1](https://github.com/Tencent-Hunyuan/HunyuanImage-2.1) を簡単に試せる環境です。  
最近の NVIDIA GPU を搭載した Windows PC が必要です。

VRAM 12GB の Geforce RTX 3060 12GB, RAM 64GB で、HunyuanImage-2.1 の標準サイズ画像 (2304x1792, FullHD 2枚分) を 70秒程度で生成します。  
推奨できる環境ではありませんが、VRAM 6GB の Geforce GTX 1660Ti, RAM 16GB で FullHD 画像を 7分程度で生成します。

![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyHu21/log/2509/GeforceGtx1660Ti.webp)

## インストール

1. [EasyHu21Installer.bat](https://github.com/Zuntan03/EasyHu21/raw/main/EasyHu21/EasyHu21Installer.bat?ver=0) をリンクを開かずに、リンク自体を右クリックして `名前をつけてリンク先を保存` します。
	- リンクを開いてから右クリックから保存すると、`bat` ファイルでなく `txt` ファイルになり実行できなくなります。
	- デフォルトでは [ComfyUI 公式が推奨している Python 3.12](https://github.com/comfyanonymous/ComfyUI#manual-install-windows-linux) を使用します。  
	[EasyHu21Installer-Python3_10.bat](https://github.com/Zuntan03/EasyHu21/raw/main/EasyHu21/EasyHu21Installer-Python3_10.bat?ver=0) でインストールすると Python 3.10 系を利用できます。
		- Python 3.10 でないと動作しない環境があるようです。  
		インストールや起動に失敗する場合は、Python 3.10 系でのインストールを試してみてください。
2. インストール先の **空フォルダ** を `C:/EasyHu21/` や `D:/EasyHu21/` などの浅いパスに用意して、`EasyHu21Installer.bat` を置いて実行します。
	- **`発行元を確認できませんでした。このソフトウェアを実行しますか？` と表示されたら `実行` します。**
	- **`WindowsによってPCが保護されました` と表示されたら、`詳細表示` から `実行` します。**
	- **`Microsoft Visual C++ 2015-2022 Redistributable` のインストールで `このアプリがデバイスに変更を加えることを許可しますか？` と表示されたら `はい` とします。**
	<!-- - **必要なファイルのダウンロードに [Civitai](https://civitai.com/) API キーが必要ですので、画面の案内や [ネット上のノウハウ](https://www.google.com/search?q=civitai+api+key) に沿って入力してください。** -->

### インストールのトラブル状況

インストールに成功する環境がありつつも、特定の環境でインストールに失敗しているようです。  
黒い画面のコマンドラインでエラーが表示されている場合は、そのエラーメッセージを共有いただけますでしょうか。

見かけた症状と検討状況


1. C++ build tool のインストールを求められる。
	- [SageAttention の v2.2.0-windows.post2](https://github.com/woct0rdho/SageAttention/releases/tag/v2.2.0-windows.post2) が怪しい。  
	EasyWan22 では post1 から post2 に上げないと動作しない環境の報告もあり。  
	もしかしたら 1 の llama-cpp-python の可能性も？
	- EasyWan22 と同様に torch 2.7.1 まで一旦引き下げる？
2. ~~llama-cpp-python を再インストールしないと動かない。~~
	- ~~EasyReforceのように llama-cpp-python  CUDA 版の導入が必要そう？トライしてみる。~~
	- CUDA 版 llama-cpp-python のインストールに対応しました。
3. ~~インストール用の bat ファイルを実行しても、コマンドプロンプトが起動しない。~~
	- ~~右クリックでの保存をやめて、ファイルの内容をテキストエディタで直接保存したら動作したとの事例あり。文字コードなどを要再確認。~~
	- リンクを開いてからの右クリック保存で bat > txt 化が罠っぽいので、誤解が生じないようにインストール方法を更新しました。

手元の情報で模索しつつ、新しい情報や問題の対処方法が判明し次第、対処します。

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

現在、ドキュメントの更新が追いついていません。

### 2025/09/15

- リポジトリを公開。
- 特定の環境で発生していると思われる問題について、README の インストールのトラブル状況 に記載。
- インストール時の `bat` の保存方法について、トラブルになりそうな説明を修正しました。
- CUDA 版 llama_cpp_python のインストールに対応しました。

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。  
別途ライセンスファイルがあるフォルダ以下は、そのライセンスです。
