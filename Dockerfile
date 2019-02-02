FROM ruby:2.6.0
LABEL maintainer="Ryan Steinberg <ryan.max.steinberg@gmail.com>"

# install nodejs for Rails
RUN apt-get update -qq && apt-get install -y nodejs

ENV app_base /CalDemo

# create and copy app files
RUN mkdir $app_base
WORKDIR $app_base
COPY . $app_base

# install rails dependencies
RUN bundle install

# compile assets
RUN RAILS_ENV=production bin/rails assets:precompile

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0", "-e", "${RAILS_ENV:-production}"]