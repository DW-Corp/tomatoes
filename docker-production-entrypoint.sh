#!/bin/bash
set -e

# Checking for MongoDB availability
mongo --host mongo --eval "use admin; db.stats();" --quiet

# Prepare the database
echo "Preparing database..."
bundle exec rake db:migrate RAILS_ENV=production

# Precompile assets (uncomment if you manage assets inside the container)
# echo "Precompiling assets..."
# bundle exec rake assets:precompile RAILS_ENV=production

# Start the Rails server in production
echo "Starting Rails in production mode..."
bundle exec rails s -e production -p 3000
