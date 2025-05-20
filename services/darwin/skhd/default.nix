{
  services.skhd = {
    enable = false;
    skhdConfig = ''
      cmd + shift - s : yabai -m window --focus next
    '';
  };
}
