#!/bin/bash

# Ensure we're in a Git directory
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Not in a Git directory."
    exit 1
fi

# Reset to the commit before the latest
git reset HEAD^

while true; do
    # Interactively add changes. Manual process.
    git add -p

    # Ask for a commit message for clarity
    read -p "Enter commit message for this smaller commit: " commit_msg

    # Commit those changes
    git commit -m "$commit_msg"

    # Ask if the user wants to continue creating commits
    read -p "Do you want to create another smaller commit? (Y/N) " answer

    if [ "$(echo "$answer" | tr '[:upper:]' '[:lower:]')" == "n" ]; then
        # If the answer is 'n' or 'N', break the loop
        break
    fi

    # Ask for the branch name
    read -p "Enter name for the new branch: " branch

    # Create a new branch with the current commit and switch to it
    git checkout -b $branch
done

echo "Done!"
