{ pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
    (writeShellScriptBin "ssh_command" ''
      case "$SSH_ORIGINAL_COMMAND" in 
        *shutdown*)    
            echo "Shutting down host.";
            sudo shutdown now;
            ;;
        *borg*)
            cd /data;
            borg serve --lock-wait 600 --restrict-to-path /data;
            ;;
        *)
          echo "not allowed";
          ;;
        esac
    '')
  ];
}
