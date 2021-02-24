#!/bin/bash

set -e

MS_TEAMS_WEBHOOK=${MS_TEAMS_WEBHOOK}
ENABLE_MS_TEAMS_NOTIFY=${ENABLE_MS_TEAMS_NOTIFY:false}
PACKAGE_VERSION=${PACKAGE_VERSION}

echo "MS_TEAMS_WEBHOOK: $MS_TEAMS_WEBHOOK"
echo "ENABLE_MS_TEAMS_NOTIFY: $ENABLE_MS_TEAMS_NOTIFY"
echo "PACKAGE_VERSION: $PACKAGE_VERSION"


if [ "$ENABLE_MS_TEAMS_NOTIFY" == "true" &&  ]; then
  curl $MS_TEAMS_WEBHOOK \
  --header 'Content-Type: application/json' \
  --data "{\"title\": \"LMS New Package:\", \"text\": \"${PACKAGE_VERSION}\"}" \
  -X POST
fi
