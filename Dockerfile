FROM ruby:3.2.0-alpine3.17

ARG RAILS_ROOT="/arms_webapp"
ARG PACKAGES="vim openssl-dev build-base curl nodejs npm less tzdata git bash screen gcompat yarn postgresql-dev"

RUN apk update \
  && apk upgrade \
  && apk add --update --no-cache $PACKAGES

RUN gem install bundler:2.4.5

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock  ./
RUN bundle install --jobs $(nproc)

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

ADD . $RAILS_ROOT
ENV PATH=$RAILS_ROOT/bin:${PATH}

EXPOSE 3000
CMD bundle exec rails s -b '0.0.0.0' -p 3000
