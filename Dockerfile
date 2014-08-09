FROM debian:jessie

MAINTAINER Ole Christian Langfjæran "https://github.com/judoole"

#Install Ruby
RUN apt-get update && apt-get install -y ruby2.1

#Install bundler
RUN gem install rubygems-update --no-ri --no-rdoc
RUN update_rubygems
RUN gem install bundler --no-ri --no-rdoc
