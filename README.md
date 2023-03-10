# Carcierge
![Carcierge](https://user-images.githubusercontent.com/97498529/221390351-4f9f68f4-6ce3-49d5-b233-6031e516182a.png)
## 概要
Carciergeは車に関するQ&Aサイトです。今では、一家に一台となった車ですが、購入を考えた際にどんなものがいいかと悩んだ時に、店頭に直接行くのは面倒臭い誰に聞けばいいかわからないといった方に使用して頂けたらと思い作成しました。一般的なQ＆Aの機能に加え画像をアップロードできるよう作成したので、車に対しての想像がしやすいようになっています。

## 使用技術

- Ruby3.1.2
- Rails6.1.7
- Rspec
- rubocop
- PostgreSQL1.1
- devise
- refile
- high_voltage
- Docker/docker-compose(開発環境)
- AWS

## ER図

![erd.pdf](https://user-images.githubusercontent.com/97498529/224223385-5f4426ca-3279-4427-8907-e2ad97118125.png)

# 当サービスについて
## 作成動機
普段、車を見るのが好きで様々な自動車サイトを見ることがあったのですが、車に疎い人やいざ購入することを検討している人は、どのようにして購入まで至っているのだろうと思いこのようなサイトがあれば役に立てるのではないかと考え、作成することに至りました。

## なぜQ＆Aサイトか
チャットだと1対1が基本形なので、多くの人からのヒントが得にくいと考えました。Q＆Aにすることにより多くの人も閲覧することができ、質問者だけではなく多くの人に知識を拡散することも狙えるからです。
多くの悩みや質問を投稿して頂ければ頂くほどノウハウの拡張やサイト自体としての価値も上がっていくと考えます。

# 機能一覧
## 認証機能
- ログイン、サインアップ機能(devise)
  - Eメール、パスワード、ユーザー名は必須(ログイン時はEメールとパスワードのみ)
  - ゲストログイン機能(ゲストユーザーは退会、プロフィール変更不可)

## 質問機能
- CRUD機能
- 画像投稿機能

## 回答機能
- 画像投稿機能

## 検索機能
- フリーワードで質問を検索可能

# Rspec
- Browse
  - 空欄でないこと

- Post
  - 空欄でないこと

- User
  - 正常に作成できること
  - 正常に削除できること
  - nameが空欄の場合、無効になること

- Browses
  - GET /new
    - リクエストが成功すること

- Posts
  - GET /new
    - リクエストが成功すること
  - GET /index
    - リクエストが成功すること
  - GET /show
    - リクエストが成功すること

- Users
  - GET /show
    - リクエストが成功すること

- Browse
  - 回答
    - 正常に回答できること

- Post
  - 投稿に関するテスト
    - 投稿のテスト
      - 正常に投稿が出来ること
    - 削除のテスト
      - 削除されるか

- User
  - 正常にサインアップできること
  - 異常値
    - 名前
      - 空白の場合
        - 失敗し、エラーメッセージが表示されること
    - メールアドレス
      - 空白の場合
        - 失敗し、エラーメッセージが表示されること
    - パスワード
      - 空白の場合
        - 失敗し、エラーメッセージが表示されること
      - 文字数が少ない場合
        - 失敗し、エラーメッセージが表示されること
      - パスワードが確認用と異なる場合
        - 失敗し、エラーメッセージが表示されること
  - 正常値
    - 正常にサインインできること
  - ゲストユーザーログイン
    - ゲストユーザーとしてログインできること

Finished in 24.05 seconds (files took 32.3 seconds to load)
21 examples, 0 failures

## 参考文献

- yahoo!知恵袋
  - https://chiebukuro.yahoo.co.jp

- teratail
  - https://teratail.com

- Qiita
  - https://qiita.com
