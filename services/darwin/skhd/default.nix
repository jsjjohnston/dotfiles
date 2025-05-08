{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      cmd + shift - s : yabai -m window --focus next
    '';
  };
}
