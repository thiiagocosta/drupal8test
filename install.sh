#!/bin/bash

# If there is any error in the building process stop
set -e
# Move hidden files aswel
shopt -s dotglob


# Environment
if [ ! -f .env ]; then
  echo "### SET $1 Environment!"
  if [[ $1 == 'dev' ]]; then
    cp .env_dev .env
  fi
fi
export $(grep -v '^#' .env | xargs)


echo "### Start Build!"
#Check Composer
if [ ! -f composer.phar ]; then
  curl -sS https://getcomposer.org/installer | php
fi

#Check Vendor
if [ $ENVIRONMENT == 'dev' ]; then
    # DEV
    echo "Composer: Clearing cache"
    php composer.phar clearcache
    echo "Composer: Install"
    php -d memory_limit=-1 composer.phar install --no-interaction --no-ansi
  else
    # PRODUCTION
    php composer.phar install --no-ansi --no-dev --no-interaction --no-plugins --no-progress --no-scripts --optimize-autoloader
fi

# Docker Clean
echo "### Docker Clean"
docker stop $(docker ps -aq) && docker rm $(docker ps -qa) && docker network prune -f

# Docker Start Project in Background
docker-compose up -d

echo "### Check PORTAL"
docker logs -f $PORTAL_URL
 
echo "### Build process success!"