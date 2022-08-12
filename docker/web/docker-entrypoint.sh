#!/bin/bash

# Exit on fail
set -e

# Bundle install
bundle install --jobs=4

# Waiting for dependent containers
/wait-for-it.sh db:3306 -t 300

# Migrate
#bundle exec rake db:create
bundle exec rake db:migrate

# Remove puma pid if existed
rm -f tmp/pids/server.pid

# Start services
bundle exec rails server --port=3000 -b 0.0.0.0

# Finally call command issued to the docker service
exec "$@"
