#!/bin/sh

set -euxo pipefail

SCRIPTDIR=$(dirname "${BASH_SOURCE[0]}")

docker-compose down
docker-compose build
docker-compose up -d

# Maximum number of attempts
MAX_ATTEMPTS=10
ATTEMPT=1

# Wait for the tor-node container to be up and running
while [ $ATTEMPT -le $MAX_ATTEMPTS ]; do
  if docker-compose exec -T tor-node sh -c 'cat /var/lib/tor/gitea_service/hostname' > /dev/null 2>&1; then
    break
  fi
  echo "Attempt $ATTEMPT/$MAX_ATTEMPTS: Waiting for tor-node to be ready..."
  ATTEMPT=$((ATTEMPT + 1))
  sleep 2
done

if [ $ATTEMPT -gt $MAX_ATTEMPTS ]; then
  echo "tor-node did not become ready in time."
  exit 1
fi

ONION=$(docker-compose exec -T tor-node cat /var/lib/tor/gitea_service/hostname)

echo "gitea is ready under ${ONION}"
