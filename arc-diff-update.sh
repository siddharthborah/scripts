#!/bin/bash

git commit --amend -a --no-edit && \
    arc diff --nounit --nolint --allow-untracked --add-all --skip-staging --message "Rebase" --excuse "Ignore"  && \ 
    phab.sh
