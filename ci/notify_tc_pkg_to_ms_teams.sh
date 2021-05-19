#!/bin/bash

set -e

MS_TEAMS_WEBHOOK=${MS_TEAMS_WEBHOOK}
ENABLE_MS_TEAMS_NOTIFY=${ENABLE_MS_TEAMS_NOTIFY:false}
PACKAGE_VERSION=${PACKAGE_VERSION}

# Version Tracker URL
VT_URL=${VT_URL}

echo "MS_TEAMS_WEBHOOK: $MS_TEAMS_WEBHOOK"
echo "ENABLE_MS_TEAMS_NOTIFY: $ENABLE_MS_TEAMS_NOTIFY"
echo "PACKAGE_VERSION: $PACKAGE_VERSION"


if [ "$ENABLE_MS_TEAMS_NOTIFY" == "true" &&  ]; then
  curl $MS_TEAMS_WEBHOOK \
  --header 'Content-Type: application/json' \
  --data "{
      \"title\": \"LMS New Package:\", 
      \"text\": \"Version: ${PACKAGE_VERSION}<br/>Please check & update [Version Tracker](${VT_URL})\"
  }" \
  -X POST
fi
