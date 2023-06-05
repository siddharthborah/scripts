#!/bin/bash

# Script to extract Differential Revision from a Git commit and open it

set -e

COMMIT_ID=$1

# Ensure a commit ID is provided
if [ -z "$COMMIT_ID" ]; then
    COMMIT_ID=$(git log --pretty=format:%H -n 1)
fi

# Extract the Differential Revision from the Git commit
DIFFERENTIAL_REV=$(git show $COMMIT_ID | grep "Differential Revision: " | awk '{print $3}')

# Ensure a Differential Revision is found
if [ -z "$DIFFERENTIAL_REV" ]; then
    echo "No Differential Revision found for commit $COMMIT_ID"
    exit 1
fi

# Open the Differential Revision in the default system browser
open "$DIFFERENTIAL_REV"