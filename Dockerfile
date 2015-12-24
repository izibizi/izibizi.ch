FROM ruby:2.2.4
MAINTAINER mhutter "https://github.com/mhutter"

ENV PORT=3000 \
    LANG=C.UTF-8 \
    RACK_ENV=production

# Set up workdir
RUN mkdir -p /app
WORKDIR /app

# install dependencies
COPY Gemfile /app/
COPY Gemfile.lock /app/
RUN bundle install --without development:test -j4 --deployment

COPY . /app/
RUN bundle exec rake assets

EXPOSE ${PORT}
CMD bundle exec rackup config.ru -p ${PORT}
