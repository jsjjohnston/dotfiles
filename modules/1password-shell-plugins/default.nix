{pkgs, ...}: {
  programs = {
    _1password-shell-plugins = {
      plugins = with pkgs; [gh awscli2 cachix cdk];
    };
  };
}
