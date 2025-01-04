{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = false;
    bashrcExtra = ''
      if [[ -z BASH_COMPLETION_VERSINFO ]]; then
        . "${pkgs.bash-completion}/etc/profile.d/bash_completion.sh"
      fi
    '';
    enableVteIntegration = true;
  };
}
