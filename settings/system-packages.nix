{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    gh
    zig
    google-chrome
    fzf
    hello
    alejandra
    ripgrep
    kitty
    rustup
    jq
  ];
}
