# README

## tasksテーブル
モデル名 : Task

|カラム名|データ型|
|----|----|
|title|string|
|content|string|
|priority|integer|
|due_date|datetime|
|status|integer|
|user_id|bigint|

## usersテーブル
モデル名 : User

|カラム名|データ型|
|----|----|
|name|string|
|email|string|
|password_digest|string|

## labelsテーブル
モデル名 : Label

|カラム名|データ型|
|----|----|
|name|string|

## set_labelsテーブル
モデル名 : Set_label

|カラム名|データ型|
|----|----|
|task_id|bigint|
|label_id|bigint|

## Herokuへのデプロイ手順

1. Heroku buildpackを追加
```
$ heroku buildpacks:set heroku/ruby
$ heroku buildpacks:add --index 1 heroku/nodejs
```
2. Herokuに新しいアプリケーションを作成
```
$ heroku create
```
3. アセットプリコンパイルをする
```
$ rails assets:precompile RAILS_ENV=production
```
4. コミットする
```
$ git add -A
$ git commit -m "###"
```
5. Herokuにデプロイする
```
$ git push heroku master
```
6. データベース移行
```
$ heroku run rails db:migrate
```