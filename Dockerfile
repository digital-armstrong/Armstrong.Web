FROM ruby:3.2.0-alpine3.17

ENV YARN_VERSION 3.5.0

ARG RAILS_ROOT="/arms_webapp"
ARG PACKAGES="vim openssl-dev build-base curl nodejs npm less tzdata git bash screen gcompat yarn postgresql-dev"

RUN apk update \
  && apk upgrade \
  && apk add --update --no-cache $PACKAGES

RUN gem install bundler:2.4.5

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

RUN rm -f tmp/pids/server.pid

COPY Gemfile Gemfile.lock  ./
RUN bundle install --jobs $(nproc)

RUN yarn policies set-version $YARN_VERSION

COPY package.json yarn.lock .yarnrc.yml ./
RUN yarn install --frozen-lockfile

ADD . $RAILS_ROOT
ENV PATH=$RAILS_ROOT/bin:${PATH}

EXPOSE 3000
CMD ["make start"]
