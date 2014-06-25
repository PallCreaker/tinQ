#化粧自撮り投稿サービス- QynQyn(仮) -
=====

### 本番環境（構成中）
+ Platform: AWS
+ OS:(EC2)CentOS
+ DB:(RDS)MySQL
+ Webサーバ: Nginx+Unicorn

### 簡単な仕様
+ web + スマホ最適化
+ sassは [fundation](http://foundation.zurb.com/)使います 

### Project Information  
+ [資料]作成中  
+ [Cacoo設計図](https://cacoo.com/diagrams/Z1HmXoD9dpMzRTLd)
←メール下さい。招待します  
+ [参考サイト-Zidory-](http://zidory.me/wanted/)  
+ コミュニケーション=>[Slack](https://matsuri.slack.com/)  
+ プロジェクト管理,コード管理=>GitHub & GitHub issuesで全部やる  


### 環境構築の仕方
```
git@github.com:PallCreaker/QynQyn.git
cp config/database.yml.sample config/database.yml
vim config/database.yml # 環境に合わせて修正
bundle install --path vendor/bundle
rake db:create # bundle exec rake db:create でも。
rake db:migrate
rake db:seed
```
