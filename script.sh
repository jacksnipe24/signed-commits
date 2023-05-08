#!/bin/sh

# Define the versions to compare
versionOrigin="1.2.3"
versionNew="1.1.8"

if [ "$(echo "$versionNew" | tr -d '.')" -gt "$(echo "$versionOrigin" | tr -d '.')" ]; then
  echo "create commit"
fi
