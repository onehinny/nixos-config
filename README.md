# How to setup

## Change hostename

The hostname ist `nixos` after install. Change in file `/etc/nixos/configuration.nix` to e.g. `backup`

```shell
sed -i 's/networking.hostname = "nixos"/networking.hostname = "backup"/g' /etc/nixos/configuration.nix
reboot
```

## Download and install

Use a shell with git to download files and install nixos and home-manager with init config

```shell
nix-shell -p git
git clone -b init https://github.com/onehinny/nixos-config.git
./.install.sh
```

## Sync to personal settings

Apply personal config.

```shell
./sync.sh
````

*You might want to update file first to use dedicated flag like so:*

```nix
sudo nixos-rebuild switch --flake .#backup
home-manager switch --flake .#backup
```