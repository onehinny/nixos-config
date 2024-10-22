{ config, pkgs, systemSettings, userSettings, ... }:

{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../base.nix
      ( import ../../system/security/sshd.nix {
                authorizedKeys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8BtHOmi6RTgFIjeFlQyzTKBVXYBBPwTdujVvxI9AqtjRsEEvSvgYfs4WogkUHoS5jmSC/ppeGZnrZlx/dhOW0s8VX8i23Fu4ATG8TSTEfUG4tyefJU2QwSH015Z1cgncjm1XDwdwCYRw/ieHG60OYYtOIb5Hdx81u78ZhCuVi4f99CkQuWzflVWNIOdfjRT6DKdbm0puG8qblmyTuI/tBzrxSFXepP9uF6McBCmUAdXRCVROQCY6W7w5a3nQLrVzkVq+pl80fI313pODMEjsqNafHdPWQg+Hq6ahKmDVn6T37aF2KVQiEBy5fgyoyfoauwxBMPLFLnp7OIZPcIPTR8U4KrFGrHHoH0hY7owUUyPcw+luhg+ucWS2otbWPhYjkAG8qHaJbd1k1IM9qKEs92UCA3ZxokboT2qRN3cqfdl4PlpBk6Co7jsfT79DzH34wOy1Sw6QJzS380sSz00BLbXQQt+C3Z/kC11y7jYku+vTGztXJIrugAfRytMCziBU= onehinny@mbp"]
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

  # Define a user account for backup tasks
  users.users.backup = {
    name = "backup";
    createHome = true;
    home = "/home/backup/";
    isNormalUser = true;
    description = "User used to do backups.";
    packages = with pkgs; [];
    openssh.authorizedKeys.keys = [ 
      		        "command=\"mkdir -p /tmp/borg && cd /tmp/borg;borg serve --restrict-to-path /tmp/borg\",restrict ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDgJXi/QVmn6jRjbly5dd1C1QrZyY7UmVINu73x+UdLGOecq6nydPeFU9fw1acynNS1v5IGJnzgxb+awgydbZJaK3XYEit1r46979MxwMlDw81A7NC+1D1ahJ1LoEWJ4DWNlzleFxnOunApD99Vx8IcdQMdPy7fF9A/Ajwb/amTW2+CdVXQbDg7QtJCKRX2eh4nzxsv7orkdFpPC6nW13yp1KBcvHqoS/zI9LztKXs3U6idmSkdLXUFFPKT84k5n0K/j2ezyYU1Dv1Zok3aILP8OUWpgHwIoiyjX7swhmDjcJIhwN9Mdpw8ReVYLrbdKkJct94lHctqhGlC8l+CW/AV7SNM5AZPlF6+S1WxBV0biJOaK2CQoXFIgtq4kxVxRJXVkhXPzbLqdfxS6ggG8YBgpwpWc7nv3i6iCYt1RthA4Aaf4RE9rFu7iGaIQRQGlMY26YJhY4uPuadH8Eac8ZxDOx8phuIfiZr5KGvtIH5sxFgV8tXuXlBZu2whgOkA6nVtHLo99gAq8tUaIUlWADQZhvgzcoZhs2gRAst65z8KjT9WZdLeKRcp9fuRG/LPKMx/HiL5TedheE9jLnBJKcuAxdKbg12AmIgLcCiMdBVoH8LzXmcv1Dj3veRcSaPR66usJcIlgeesjKmSq+xegyAQK6vMHAnXpr2zI6n3jetP+w== backup machine" 
		            ];
  };
}
