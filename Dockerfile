FROM ruby:2.6-slim

LABEL Name=conwayruby Version=0.0.1

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem update --system
RUN gem install bundler
RUN bundle install

COPY . /app


CMD /app/entry.sh
