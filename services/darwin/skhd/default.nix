{
  services.skhd = {
    enable = true;
    skhdConfig = ''
      alt - j : yabai -m window --focus stack.next
      alt - k : yabai -m window --focus stack.prev
      cmd + shift - s : open /System/Applications/Utilities/Screenshot.app
    '';
  };
}
