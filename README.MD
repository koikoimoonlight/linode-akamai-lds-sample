
# LinodeでAkamaiのLDS用のFTPサーバーを建てるサンプルコード

学習用に作成したコードのサンプルです。  
1. LinodeでUbuntuをFTPサーバーとしてセットアップ
2. FTPデータ用の追加ボリュームを割り当てる
3. Linode Firewallで必要なポートをオープンする

## 設定

スペックやIP許可の設定は`variables.tf`に記述します。

リージョン、OSイメージ、linodeのスペックを指定する際の固有名詞はLinode CLIを使用して確認  
[Linode CLIのインストール](https://qiita.com/isss802/items/0b1be79031ee16ced521)を参照

```
linode-cli regions list
linode-cli images list
linode-cli linodes types
```

## 展開

以下の変数を予め宣言してから実行する。  
宣言していない場合は、各項目をterraform実行時に入力

> authorized_keysはLinodeのサーバー側にSSH接続するための公開鍵を指定します。

```
export TF_VAR_authorized_keys=""
export TF_VAR_linode_token=""
export TF_VAR_root_password=""
export TF_VAR_ftp_username=""
export TF_VAR_ftp_password=""
terraform init
terraform plan
terraform apply -auto-approve
```

## 展開後のOS構成

下記のStackScriptに従ってセットアップされます。  
https://cloud.linode.com/stackscripts/1389569