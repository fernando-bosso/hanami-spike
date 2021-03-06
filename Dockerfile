FROM ruby:latest
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql

WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN echo 'gem: --no-document' > ~/.gemrc \
  && bundle install

ADD . /app
