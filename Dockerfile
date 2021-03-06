# https://blog.codeship.com/deploying-docker-rails-app/

FROM ruby:2.4.1
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs imagemagick
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp

# Set Rails to run in production
ENV RAILS_ENV production
ENV RACK_ENV production

# Copy the main application.
COPY . ./

# Precompile Rails assets
RUN RAILS_ENV=production SECRET_KEY_BASE=$(bin/rails secret) bin/rails assets:precompile