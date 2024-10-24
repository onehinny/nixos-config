# Rebuild system
sudo nixos-rebuild switch --flake .

# Install and build home-manager configuration
nix --extra-experimental-features "nix-command flakes" run home-manager/release-24.05 -- init --switch