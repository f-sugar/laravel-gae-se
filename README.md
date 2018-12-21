# laravel-gae-se

## 実行環境
```
$ sw_vers
ProductName:    Mac OS X
ProductVersion: 10.14.2
BuildVersion:   18C54
```

```
$ docker -v
Docker version 18.09.0, build 4d60db4
```

```
$ docker-compose -v
docker-compose version 1.23.2, build 1110ad01
```

```
$ gcloud -v
Google Cloud SDK 228.0.0
bq 2.0.39
core 2018.12.07
gsutil 4.34
```

## ローカルで実行
```
$ docker-compose build
```

### .env作成
```
$ cp .env.example .env
```

### APP_KEY生成
```
$ docker-compose run --rm php php artisan key:generate
```

### 実行
```
$ docker-compose run
```

## GAEにデプロイ
### app.yamlにAPP_KEY設定
```
$ sed -i '' "s#MY_APP_KEY#$(docker-compose run --rm php php artisan key:generate --show --no-ansi)#" app.yaml
```

### デプロイ
```
$ gcloud app deploy
```

### デプロイされたことを確認
```
$ gcloud app browse
```