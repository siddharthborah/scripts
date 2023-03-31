#!/bin/bash
git show $1 | grep "Differential Revision: " | awk '{print $3}' | xargs open