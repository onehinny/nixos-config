nix-shell -p git --command "git clone -b init https://github.com/onehinny/nixos-config.git"

# Rebuild system
sudo nixos-rebuild switch --flake .

# Install and build home-manager configuration
nix run home-manager/master --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake .