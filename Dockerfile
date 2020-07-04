FROM ruby:2.6.6
RUN useradd -u 1000 --create-home --home-dir /xyz --shell /bin/bash examatic

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get install -y nodejs yarn

RUN mkdir /examatic
WORKDIR /examatic
COPY Gemfile /examatic/Gemfile
COPY Gemfile.lock /examatic/Gemfile.lock

# USER examatic
RUN bundle install
COPY . /examatic
