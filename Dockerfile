FROM debian:jessie

MAINTAINER Ole Christian Langfjæran "https://github.com/judoole"

#Install Java
RUN apt-get update && apt-get install -y openjdk-7-jre-headless

#Download and Install JRuby
WORKDIR /tmp
ADD http://jruby.org.s3.amazonaws.com/downloads/1.7.13/jruby-bin-1.7.13.tar.gz /tmp/
RUN mkdir /jruby-1.7.13 && tar -xvzf jruby-bin-1.7.13.tar.gz -C /
RUN rm -rf jruby-bin-1.7.13.tar.gz
ENV PATH /jruby-1.7.13/bin:$PATH


# Add options to gemrc. No docs please.
RUN echo "gem: --no-ri --no-document" > ~/.gemrc

#Install bundler
RUN gem install rubygems-update
RUN update_rubygems
RUN gem install bundler
