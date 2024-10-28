{ pkgs, ... }:

{
  ssh_command =
    pkgs.writeScriptBin "/home/backup/.ssh_command" ''
      case "$SSH_ORIGINAL_COMMAND" in 
        *shutdown*)    
          echo "Shutting down host."
          sudo shutdown now
          ;;
        *)
          echo "serving borg ... \n"
          cd /data
          borg serve --lock-wait 600 --restrict-to-path /data
          ;;
      esac
    '';
}
