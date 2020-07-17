FROM ruby:2.6.6
RUN useradd -u 1000 --create-home --home-dir /xyz --shell /bin/bash examatic

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get install -y nodejs yarn

ENV APP_HOME /examatic

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile $APP_HOME/Gemfile
COPY Gemfile.lock $APP_HOME/Gemfile.lock

# USER examatic
ENV BUNDLE_PATH=/bundle

RUN bundle install
COPY . /examatic
