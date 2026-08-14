# syntax = docker/dockerfile:1

ARG RUBY_VERSION=3.3
FROM --platform=linux/amd64 ruby:$RUBY_VERSION-slim AS base

WORKDIR /rails

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      build-essential \
      curl \
      libpq-dev \
      pkg-config \
      postgresql-client \
      git && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle"

COPY Gemfile ./

RUN bundle install

COPY . .

RUN chmod +x bin/*

EXPOSE 3000

CMD ["bin/rails", "server", "-b", "0.0.0.0"]
