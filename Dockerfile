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

# default Rails environment variables
ENV RAILS_ENV production
ENV RAILS_LOG_TO_STDOUT enabled
ENV RAILS_SERVE_STATIC_FILES enabled

CMD ["rails", "server", "-b", "0.0.0.0"]