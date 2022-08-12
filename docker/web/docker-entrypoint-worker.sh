g#!/bin/bash

# Exit on fail
set -e

# Waiting for dependent containers
/wait-for-it.sh web:3000 -t 300

# Bundle install
bundle install --jobs=4

# Start services
bundle exec sidekiq -C config/sidekiq.yml > ./log/sidekiq.log 2>&1

# Finally call command issued to the docker service
exec "$@"
