FROM ruby:2.6.3

COPY . /app
WORKDIR /app

RUN gem install rails bundler
RUN bundle install

ENV RAILS_ENV production