#!/bin/bash
set -e

# bundle update definitions
bundle install

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

bundle exec rake prices
bundle exec rake assets:precompile

exec "$@"
