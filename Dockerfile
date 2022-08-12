FROM ruby:2.6.6

ENV BUNDLE_APP_CONFIG=.bundle

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get install -y nodejs yarn

RUN apt-get update && apt-get install -y --no-install-recommends \
  nodejs \
  npm \
  postgresql-client

RUN gem install bundler:2.3.7
RUN bundle config path 'vendor/cache'

WORKDIR /app
