{pkgs, ...}: {
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    font-awesome_5
    font-awesome_6
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    noto-fonts-emoji
  ];
}
