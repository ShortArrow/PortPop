# PortPop のビルド方法

このプロジェクトには、インストーラーを作成する方法と、アプリケーション本体のみをビルドする方法の2つがあります。

## 1. インストーラー (.msi) を作成する方法

プロジェクトのルートにある `build.bat` を実行することで、`.msi` 形式のインストーラーが作成されます。

### 必要な環境

*   Visual Studio がインストールされている必要があります。
    *   スクリプトは Visual Studio (`devenv.exe`) を自動的に検索して使用します。

### 実行手順

コマンドプロンプトや PowerShell で以下のコマンドを実行します。

```shell
.\build.bat
```

### 出力先

ビルドが成功すると、インストーラー (`.msi` ファイル) は以下のフォルダに出力されます。

```
.\PortPopInstaller\Release\
```

---

## 2. アプリケーション本体のみをビルドする方法 (`dotnet publish`)

**注意:** この方法ではインストーラー (`.msi`) は作成されません。アプリケーションの実行に必要なファイル群 (`.exe`, `.dll` など) が生成されます。

.NET 8 SDK がインストールされていれば、コマンドラインから直接アプリケーションをビルドできます。

以下のコマンドをプロジェクトのルートディレクトリで実行します。

```shell
dotnet publish PortPop -p:TargetFramework=net8.0-windows -c Release -r win-x64
```

### 出力先

ビルドが成功すると、実行ファイル群は以下のフォルダに出力されます。

```
.\PortPop\bin\Release\net8.0-windows\win-x64\publish\
```