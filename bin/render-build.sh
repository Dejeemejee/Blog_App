#!/usr/bin/env bash

# Exit on error
set -o errexit

# Install PostgreSQL development files
apt-get update -qq && apt-get install -y postgresql-client libpq-dev

bundle install
bin/rails assets:precompile
bin/rails assets:clean

# If you have a paid instance type, we recommend moving
# database migrations like this one from the build command
# to the pre-deploy command:
bin/rails db:migrate