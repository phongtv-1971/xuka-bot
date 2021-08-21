## Deploy local
```bash
git clone git@github.com:phongtv-1971/xuka-bot.git
cd xuka-bot
bundle install
cp config/application.yml.example config/application.yml
rails db:create
rails db:migrate
rails db:seed
```

## Deploy docker
```bash
git clone git@github.com:phongtv-1971/xuka-bot.git
cd xuka-bot
cp config/application.yml.example config/application.yml
docker-compose -f docker-compose.dev.yml build
docker-compose -f docker-compose.dev.yml up -d
docker-compose exec xukabot bundle exec rails db:seed
```
