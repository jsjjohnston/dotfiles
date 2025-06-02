{
  programs.qutebrowser.settings.fileselect = {
    handler = "default";
    multiple_files = {
      command = [
        "xterm"
        "-e"
        "ranger"
        "--choosefiles={}"
      ];
    };
    single_file = {
      command = [
        "xterm"
        "-e"
        "ranger"
        "--choosefiles={}"
      ];
    };
    folder = {
      command = [
        "xterm"
        "-e"
        "ranger"
        "--choosedir={}"
      ];
    };
  };
}
