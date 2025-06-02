{
  programs.qutebrowser.settings.hints = {
    auto_follow = "unique-match";
    auto_follow_timeout = 0;
    border = "1px solid E3BE23";
    chars = "asdfghjkl";
    dictionary = "/usr/share/dict/words";
    find_implementation = "python";
    hide_unmatched_rapid_hints = true;
    leave_on_load = false;
    min_chars = 1;
    mode = "letter";
    next_regexes = [
      "\bnext\b"
      "\bmore\b"
      "\bnewer\b"
      "\b[>→≫]\b"
      "\b(>>|»)\b"
      "\bcontinue\b"
    ];
    # padding = [];
    prev_regexes = [
      "\bprev(ious)?\b"
      "\bback\b"
      "\bolder\b"
      "\b[<←≪]\b"
      "\b(<<|«)\b"
    ];
    radius = 3;
    scatter = true;
    selectors = {
      # all = [
      # "a"
      # "area"
      # "textarea"
      # "select"
      # "input:not([type=\"hidden\"])"
      # "button"
      # "frame"
      # "iframe"
      # "img"
      # "link"
      # "summary"
      # "[contenteditable]:not([contenteditable=\"false\"])"
      # "[onclick]"
      # "[onmousedown]"
      # "[role=\"link\"]"
      # "[role=\"option\"]"
      # "[role=\"button\"]"
      # "[role=\"tab\"]"
      # "[role=\"checkbox\"]"
      # "[role=\"switch\"]"
      # "[role=\"menuitem\"]"
      # "[role=\"menuitemcheckbox\"]"
      # "[role=\"menuitemradio\"]"
      # "[role=\"treeitem\"]"
      # "[aria-haspopup]"
      # "[ng-click]"
      # "[ngClick]"
      # "[data-ng-click]"
      # "[x-ng-click]"
      # "[tabindex]:not([tabindex=\"/-1\"])"
      # ];
      # images = [
      # "img"
      # ];
      # inputs = [
      # "input[type=\"text\"]"
      # "input[type=\"date\"]"
      # "input[type=\"datetime-local\"]"
      # "input[type=\"email\"]"
      # "input[type=\"month\"]"
      # "input[type=\"number\"]"
      # "input[type=\"password\"]"
      # "input[type=\"search\"]"
      # "input[type=\"tel\"]"
      # "input[type=\"time\"]"
      # "input[type=\"url\"]"
      # "input[type=\"week\"]"
      # "input:not([type])"
      # "[contenteditable]:not([contenteditable=\"false\"])"
      # "textarea"
      # ];
      # links = [
      # "a[href]"
      # "area[href]"
      # "link[href]"
      #
      # "[role=\"link\"][href]"
      # ];
      # media = [
      # "audio"
      # "img"
      # "video"
      # ];
      # url = [
      # "[src]"
      # "[href]"
      # ];
    };
    uppercase = false;
  };
}
