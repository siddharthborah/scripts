#!/bin/bash
echo "chmod u+x for all scripts under $scripts/"
chmod u+x $scripts/*.sh

echo "Creating symlink under ~/bin"
ln -s $scripts/*.sh ~/bin