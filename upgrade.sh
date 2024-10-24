#!/bin/sh

# Script to update system and sync
# Does not pull changes from git

# Update flake
./update.sh;

# Synchronize system
./sync.sh;