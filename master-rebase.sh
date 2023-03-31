#!/bin/bash

# Save the current branch name
CURRENT_BRANCH=$(git branch --show-current)

# Switch to the master branch
git checkout master

# Pull any updates from the origin
git pull --rebase origin master;
git submodule update --init --recursive
#git fetch origin
#git rebase origin/master

# Switch back to the original branch
git checkout $CURRENT_BRANCH

# Rebase with master
git rebase master