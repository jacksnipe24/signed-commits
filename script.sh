#!/bin/bash

# Versions to compare
versionOrigin="1.1.5"
versionNew="1.0.9"

# Split versions into major, minor, and patch components
IFS='.' read -r -a bump <<< "$versionOrigin"
IFS='.' read -r -a new <<< "$versionNew"

# Initialize flag to indicate HIGHEST_VERSION of version comparison
HIGHEST_VERSION="equal"

# Compare major version number
if (( bump[0] > new[0] )); then
  HIGHEST_VERSION="bump"
elif (( bump[0] < new[0] )); then
  HIGHEST_VERSION="new"
else
  # Compare minor version number
  if (( bump[1] > new[1] )); then
    HIGHEST_VERSION="bump"
  elif (( bump[1] < new[1] )); then
    HIGHEST_VERSION="new"
  else
    # Compare patch version number
    if (( bump[2] > new[2] )); then
      HIGHEST_VERSION="bump"
    elif (( bump[2] < new[2] )); then
      HIGHEST_VERSION="new"
    fi
  fi
fi


# Output the HIGHEST_VERSION
if [[ ${bump[0]} < ${new[0]} || ${bump[1]} < ${new[1]} || ${bump[2]} < ${new[2]} ]]; then
  echo "create commit"
fi
