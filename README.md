# php-development-docker
[![dockeri.co](https://dockeri.co/image/nursesenka/php-development)](https://hub.docker.com/r/nursesenka/php-development)

PHP用Dockerイメージを管理する（開発用）

`php:7.2.14-fpm-alpine`をベースとし、`php.ini`の設定と必要なライブラリをインストールしたイメージです。

開発用のため`Xdebug`も追加しています。

## Docker Hub

https://cloud.docker.com/u/nursesenka/repository/docker/nursesenka/php-development

## Badge
以下で作成出来ます。

https://dockeri.co/

## 検証手順

ビルドが実行できることを確認してください。

```
docker build -t nursesenka/php-development .
```


`docker images`を実行し、`nursesenka/php-development`というイメージが作成されていることを確認してください。
```
REPOSITORY                         TAG                 IMAGE ID            CREATED             SIZE
nursesenka/php-development         latest              d0535faa11a6        24 seconds ago      325MB
```

下記を実行し、コンテナが起動できることとXdebugがインストールされていることを確認してください。
```
docker run -it nursesenka/php-development php -m
```

```
[Zend Modules]
Xdebug
```

## 自動Buildについて

GitHub上でタグをPushするとDocker Hub上にも反映されます。

例えばこのようなタグを設定すると・・・

```bash
git tag -a v1.0.0 -m "release version v1.0.0"
git push origin tags/v1.0.0
```

Docker Hub上では `1.0.0` のタグが自動で作成されます。（`v1.0.0` のように `v` が必要なので注意）

## バージョニングについて

[セマンティック バージョニング](https://semver.org/lang/ja/) を採用します。

## バージョンアップのルール

- 初期バージョンは `1.0.0` からスタート
- 利用するPHPのパッチバージョンが上がった場合はこちらもパッチバージョンを上げる
  - e.g PHP7.2.0から7.2.10を使うようになった場合、`1.0.1` となる。
- PHPの拡張を追加した場合
  - e.g memcache.soを追加した場合 `1.0.0` から `1.1.0` となる
- PHPのマイナーバージョンが上がった場合
  - e.g PHP7.2系から7.3系を利用するようになった場合 `1.1.0` から `2.0.0` となる

本来PHPのバージョニングに合わせるべきかと思いますがPHPはマイナーバージョンでも破壊的な変更があることが少なくないので、このようなルールに設定してあります。
