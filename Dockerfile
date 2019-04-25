FROM ruby:2.6.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /turnz-api
WORKDIR /turnz-api
COPY Gemfile /turnz-api/Gemfile
COPY Gemfile.lock /turnz-api/Gemfile.lock
RUN bundle install
COPY . /app