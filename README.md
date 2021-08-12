## Deploy local
```bash
git clone git@github.com:phongtv-1971/xuka-bot.git
cd xuka-bot
bundle install
cp config/application.yml.example config/application.yml
rails db:create
rails db:migrate
```
