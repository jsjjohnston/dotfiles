{...}: {
  environment.pathsToLink = ["/share/bash-completion"];
  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    historyFile = ./historyFile;
  };
}
