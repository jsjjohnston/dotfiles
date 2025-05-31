{
  programs = {
    qutebrowser = {
      keyBindings = {
        command = {
          "<Alt-B>" = "rl-backward-word";
          "<Alt-Backspace>" = "rl-backward-kill-word";
          "<Alt-D>" = "rl-kill-word";
          "<Alt-F>" = "rl-forward-word";
          "<Ctrl-?>" = "rl-delete-char";
          "<Ctrl-A>" = "rl-beginning-of-line";
          "<Ctrl-B>" = "rl-backward-char";
          "<Ctrl-C>" = "completion-item-yank";
          "<Ctrl-D>" = "completion-item-del";
          "<Ctrl-E>" = "rl-end-of-line";
          "<Ctrl-F>" = "rl-forward-char";
          "<Ctrl-H>" = "rl-backward-delete-char";
          "<Ctrl-K>" = "rl-kill-line";
          "<Ctrl-N>" = "command-history-next";
          "<Ctrl-P>" = "command-history-prev";
          "<Ctrl-Return>" = "command-accept --rapid";
          "<Ctrl-Shift-C>" = "completion-item-yank --sel";
          "<Ctrl-Shift-Tab>" = "completion-item-focus prev-category";
          "<Ctrl-Shift-W>" = "rl-filename-rubout";
          "<Ctrl-Tab>" = "completion-item-focus next-category";
          "<Ctrl-U>" = "rl-unix-line-discard";
          "<Ctrl-W>" = "rl-rubout \"";
          "<Ctrl-Y>" = "rl-yank";
          "<Down>" = "completion-item-focus --history next";
          "<Escape>" = "mode-leave";
          "<PgDown>" = "completion-item-focus next-page";
          "<PgUp>" = "completion-item-focus prev-page";
          "<Return>" = "command-accept";
          "<Shift-Delete>" = "completion-item-del";
          "<Shift-Tab>" = "completion-item-focus prev";
          "<Tab>" = "completion-item-focus next";
          "<Up>" = "completion-item-focus --history prev";
        };
      };
    };
  };
}
