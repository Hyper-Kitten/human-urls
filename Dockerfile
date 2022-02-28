FROM ruby:3.1.1-alpine

RUN apk update && apk add less build-base postgresql-dev chromium chromium-chromedriver gcompat

RUN mkdir /app
WORKDIR /app

COPY human_urls.gemspec Gemfile Gemfile.lock ./
COPY ./lib/human_urls/version.rb ./lib/human_urls/
RUN bundle install

COPY . .

LABEL maintainer="Josh Klina"

CMD puma -C config/puma.rb
