{
  programs.qutebrowser.settings.editor = {
    command = [
      "nvim"
      "-f"
      "{file}"
      "-c"
      "normal {line}G{column0}l"
    ];
    encoding = "utf-8";
    remove_file = true;
  };
}
