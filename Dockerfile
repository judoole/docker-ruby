FROM debian:jessie

MAINTAINER Ole Christian Langfjæran "https://github.com/judoole"

#Install Ruby
RUN apt-get update && apt-get install -y ruby2.1
 
# Add options to gemrc. No docs please.
RUN echo "gem: --no-ri --no-document" > ~/.gemrc

#Install bundler
RUN gem install rubygems-update
RUN update_rubygems
RUN gem install bundler
