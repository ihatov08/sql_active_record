#!/usr/local/bin/fish

echo "deploy to production"
git push heroku master
heroku run rake db:migrate
heroku run rake db:seed_fu
heroku open
