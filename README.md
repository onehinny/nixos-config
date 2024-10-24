# How to setup

## Change hostename

The hostname ist `nixos` after install. Change in file `/etc/nixos/configuration.nix` to e.g. `backup`

```shell
sed -i 's/networking.hostname = "nixos"/networking.hostname = "backup"/g' /etc/nixos/configuration.nix
reboot
```

## Download and install

Use a shell with git to download files

```shell
nix-shell -p git
git clone -b init https://github.com/onehinny/nixos-config.git
./.install.sh
```
