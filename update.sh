#!/bin/sh

# Script to update my flake without
# synchronizing configuration

sudo nix flake update;
sudo nix-channel --update;
nix-channel --update;