{
  programs.
    qutebrowser.keyBindings.yesno = {
    "<Alt-Shift-Y>" = "prompt-yank --sel";
    "<Alt-Y>" = "prompt-yank";
    "<Escape>" = "mode-leave";
    "<Return>" = "prompt-accept";
    "N" = "prompt-accept --save no";
    "Y" = "prompt-accept --save yes";
    "n" = "prompt-accept no";
    "y" = "prompt-accept yes";
  };
}
