{pkgs, ...}: {
  programs.gh = {
    enable = true;
    extensions = [
      pkgs.gh-dash
    ];
    gitCredentialHelper = {
      enable = true;
      hosts = [
        "https://github.com"
        "https://gist.github.com"
        "https://github.com/MontuGroup"
      ];
    };
    settings = {
      git_protocol = "ssh";

      prompt = "enabled";
      editor = "nvim";
    };
  };
}
