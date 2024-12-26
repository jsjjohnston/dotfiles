{ ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    initExtra = ''
      source /Users/jay/.config/op/plugins.sh
    '';
  };
}
