飲み会名簿 with Heroku
=============

[ふんパチ飲み会](http://funpachin.herokuapp.com/) で使われているメンバー管理ツールです。

Rails と Twitter-Bootstrap と OmniAuth で作った単純な名簿管理で、  
特別な事は何もやってません。

Rails ってどうやって使うのかなーとか、  
Twitter 連携ってどうしたらいいんだろうとか、  
そういうあたりの勉強にどうぞ。


インストール
=============
* db/seeds.rb を書き換えて管理者のTwitterIDを登録
* config/constant.yml を書き換えて Twitter OAuth の Token/Secret を登録
* config/newrelic.yml を書き換えて newrelic のライセンスキーを登録
* config/initializers/secret_token.rb を書き換えて token を登録


必要なアドオン
=============
* ClearDB MySQL Database

ローカルでの起動
=============
* rake db:setup db:migrate db:seed してから unicorn_rails -c config/unicorn.rb
