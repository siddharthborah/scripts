#!/bin/bash

# Function to show usage and exit with error code
usage() {
    echo "Usage: $0 <scripts_directory>"
    exit 1
}

# Check if the scripts directory is provided as an argument
if [ $# -ne 1 ]; then
    usage
fi

scripts="$1"

# Check if the provided directory exists
if [ ! -d "$scripts" ]; then
    echo "Error: Directory '$scripts' not found."
    exit 1
fi

# Check if the user has permission to read and execute the scripts directory
if [ ! -r "$scripts" ] || [ ! -x "$scripts" ]; then
    echo "Error: Insufficient permissions to access '$scripts' directory."
    exit 1
fi

# Add informative comments for each step
echo "Setting execute permissions for all scripts under $scripts/"
chmod u+x "$scripts"/*.{sh,py}

# Check if the ~/bin directory exists, if not, create it
if [ ! -d ~/bin ]; then
    echo "Creating ~/bin directory"
    mkdir ~/bin
fi

# Add informative comments for each step
echo "Creating symlinks under ~/bin"
for script_file in "$scripts"/*.{sh,py}; do
    # Get the filename without the path
    script_name=$(basename "$script_file")

    # Check if the symlink already exists, if yes, skip this script
    if [ -e ~/bin/"$script_name" ]; then
        echo "Warning: Symlink for '$script_name' already exists. Skipping."
        continue
    fi

    # Create the symlink
    ln -s "$script_file" ~/bin/"$script_name"
    if [ $? -eq 0 ]; then
        echo "Symlink created for '$script_name'"
    else
        echo "Error: Failed to create symlink for '$script_name'"
    fi
done

# Print a message indicating success
echo "Script setup completed successfully."
