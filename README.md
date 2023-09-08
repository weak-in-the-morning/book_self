# book_self
## run
```
cd app
flutter pub get
flutter run
```

# 作業時のルール
## 作業を開始する時
mainを最新にする
```
git switch main
git pull
```

mainからbranchを切る
名前/作業内容
```
git switch -c <ブランチ名>
```
例:
```
git switch -c fujita/create-flutter-app
```

## 作業が完了してgithubにpushする時
```
git add .
or
git add <変更を加えたファイル名>
```

```
git commit -m "コミットメッセージ"
```

```
git push origin <ブランチ名>
```

githubを開きpull requestを作成する


