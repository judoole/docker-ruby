Docker Ruby
===========

A base image for ruby containers. Tries to be as slim as possible, based on debian:jessie.

## Example Usage
```ruby
FROM judoole/ruby:2.1
# Install extra packages that is demanded by app
# git, ruby-dev, gcc, g++ and make for when using github repos for gems
RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev freetds-dev git ruby-dev gcc g++ make

# Copy the Gemfile and Gemfile.lock into the image.
# This ensures that bundle install is not run every time docker build is run
# Temporarily set the working directory to where they are.
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

# Everything up to here was cached. This includes
# the bundle install, unless the Gemfiles changed.
# Now copy the app into the image.
ADD . /app

# Set the final working dir to the Rails app's location.
WORKDIR /app

# Set up a default runtime command
CMD rails server
```
