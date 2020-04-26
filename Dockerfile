FROM ruby:2.7.1-alpine

RUN apk add --update --no-cache bash build-base nodejs sqlite-dev tzdata postgresql-dev yarn

RUN gem install bundler -v 2.1.4

WORKDIR /usr/src/app/

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundle install

COPY package.json ./package.json
COPY yarn.lock ./yarn.lock
RUN yarn install --check-files

COPY . .

CMD ["rails", "console"]
