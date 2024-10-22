{ config, pkgs, systemSettings, userSettings, ... }:

{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../base.nix
      ( import ../../system/security/sshd.nix {
                authorizedKeys = [ 
      		  "command=\"mkdir -p /tmp/borg && cd /tmp/borg;borg serve --restrict-to-path /tmp/borg\",restrict ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDgJXi/QVmn6jRjbly5dd1C1QrZyY7UmVINu73x+UdLGOecq6nydPeFU9fw1acynNS1v5IGJnzgxb+awgydbZJaK3XYEit1r46979MxwMlDw81A7NC+1D1ahJ1LoEWJ4DWNlzleFxnOunApD99Vx8IcdQMdPy7fF9A/Ajwb/amTW2+CdVXQbDg7QtJCKRX2eh4nzxsv7orkdFpPC6nW13yp1KBcvHqoS/zI9LztKXs3U6idmSkdLXUFFPKT84k5n0K/j2ezyYU1Dv1Zok3aILP8OUWpgHwIoiyjX7swhmDjcJIhwN9Mdpw8ReVYLrbdKkJct94lHctqhGlC8l+CW/AV7SNM5AZPlF6+S1WxBV0biJOaK2CQoXFIgtq4kxVxRJXVkhXPzbLqdfxS6ggG8YBgpwpWc7nv3i6iCYt1RthA4Aaf4RE9rFu7iGaIQRQGlMY26YJhY4uPuadH8Eac8ZxDOx8phuIfiZr5KGvtIH5sxFgV8tXuXlBZu2whgOkA6nVtHLo99gAq8tUaIUlWADQZhvgzcoZhs2gRAst65z8KjT9WZdLeKRcp9fuRG/LPKMx/HiL5TedheE9jLnBJKcuAxdKbg12AmIgLcCiMdBVoH8LzXmcv1Dj3veRcSaPR66usJcIlgeesjKmSq+xegyAQK6vMHAnXpr2zI6n3jetP+w== backup machine" 
		  ];
                inherit userSettings; })     
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   borgbackup
  ];
}
