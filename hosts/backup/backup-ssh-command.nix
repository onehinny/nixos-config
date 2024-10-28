{ pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
    (writeShellScriptBin "ssh_command" ''
      case "$SSH_ORIGINAL_COMMAND" in 
        *shutdown*)    
            echo "Shutting down host.";
            sudo shutdown now;
            ;;
          *)
            cd /data;
            borg serve --lock-wait 600 --restrict-to-path /data;
            ;;
        esac
    '')
  ];
}
