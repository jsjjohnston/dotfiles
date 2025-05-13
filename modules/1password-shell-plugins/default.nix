{pkgs, ...}: {
  programs = {
    _1password-shell-plugins = {
      plugins = with pkgs; [
        awscli2
        cachix
        cdk
        gcloud
        gh
        kubectl
        terraform
      ];
    };
  };
}
