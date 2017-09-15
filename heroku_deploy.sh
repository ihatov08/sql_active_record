#!/bin/bash

echo "deploy to production"
git push heroku master
heroku run rake db:migrate
