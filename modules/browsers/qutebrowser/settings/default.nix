{
  imports = [
    ./auto_save
    ./backend
    ./completion
    ./content
    ./downloads
    ./editor
    ./fileselect
    ./fonts
    ./greasemonkey
    ./hints
    ./input
    ./keyhint
    ./logging
    ./prompt
    ./qt
    ./scrolling
    ./search
    ./session
    ./spellcheck
    ./statusbar
    ./tabs
    ./url
    ./window
    ./zoom
  ];
  programs.qutebrowser.settings = {
    changelog_after_upgrade = "minor";
    confirm_quit = ["downloads"];
    history_gap_interval = 30;
    messages.timeout = 3000;
    new_instance_open_target = "tab";
    new_instance_open_target_window = "last-focused";
  };
}
