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
      prefer_editor_prompt = "enabled";
      color_labels = "enabled";
      accessible_colors = "enabled";
      accessible_prompter = "enabled";
      spinner = "enabled";
      aliases = {
        co = "pr checkout";
        pv = "pr view";
        cm = "repo clone";
        hist = "repo history";
      };
    };
  };
}
