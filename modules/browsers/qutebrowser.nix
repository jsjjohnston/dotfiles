{pkgs, ...}: {
  programs = {
    qutebrowser = {
      enable = true;
      aliases = {};
      enableDefaultBindings = true;
      settings.greasemonkey = {};
      keyMappings = {};
      loadAutoconfig = false;
      keyBindings = {
        caret = {
          "$" = "move-to-end-of-line";
          "0" = "move-to-start-of-line";
          "<Ctrl-Space>" = "selection-drop";
          "<Escape>" = "mode-leave";
          "Return>" = "yank selection";
          "<Space>" = "selection-toggle";
          "G" = "move-to-end-of-document";
          "H" = "scroll left";
          "J" = "scroll down";
          "K" = "scroll up";
          "L" = "scroll right";
          "V" = "selection-toggle --line";
          "Y" = "yank selection -s";
          "[" = "move-to-start-of-prev-block";
          "]" = "move-to-start-of-next-block";
          "b" = "move-to-prev-word";
          "c" = "mode-enter normal";
          "e" = "move-to-end-of-word";
          "gg" = "move-to-start-of-document";
          "h" = "move-to-prev-char";
          "j" = "move-to-next-line";
          "k" = "move-to-prev-line";
          "l" = "move-to-next-char";
          "o" = "selection-reverse";
          "v" = "selection-toggle";
          "w" = "move-to-next-word";
          "y" = "yank selection";
          "{" = "move-to-end-of-prev-block";
          "}" = "move-to-end-of-next-block";
        };
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

        hint = {
          "<Ctrl-B>" = "hint all tab-bg";
          "<Ctrl-F>" = "hint links";
          "<Ctrl-R>" = "hint --rapid links tab-bg";
          "<Escape>" = "mode-leave";
          "<Return>" = "hint-follow";
        };
        insert = {
          "<Ctrl-E>" = "edit-text";

          "<Escape>" = "mode-leave";

          "<Shift-Escape>" = "fake-key <Escape>";

          "<Shift-Ins>" = "insert-text -- {primary}";
        };
        normal = {
          "<ctrl-v>" = "hint links spawn ${pkgs.mpv}/bin/mpv {hint-url}";
          "<ctrl-shift-v>" = "spawn ${pkgs.mpv}/bin/mpv {url}";
          "'" = "mode-enter jump_mark";
          "+" = "zoom-in";
          "-" = "zoom-out";
          "." = "cmd-repeat-last";
          ";I" = "hint images tab";
          ";O" = "hint links fill :open -t -r {hint-url}";
          ";R" = "hint --rapid links window";
          ";Y" = "hint links yank-primary";
          ";b" = "hint all tab-bg";
          ";d" = "hint links download";
          ";f" = "hint all tab-fg";
          ";h" = "hint all hover";
          ";i" = "hint images";
          ";o" = "hint links fill :open {hint-url}";
          ";r" = "hint --rapid links tab-bg";
          ";t" = "hint inputs";
          ";y" = "hint links yank";
          "<Alt-1>" = "tab-focus 1";
          "<Alt-2>" = "tab-focus 2";
          "<Alt-3>" = "tab-focus 3";
          "<Alt-4>" = "tab-focus 4";
          "<Alt-5>" = "tab-focus 5";
          "<Alt-6>" = "tab-focus 6";
          "<Alt-7>" = "tab-focus 7";
          "<Alt-8>" = "tab-focus 8";
          "<Alt-9>" = "tab-focus -1";
          "<Alt-m>" = "tab-mute";
          "<Ctrl-A>" = "navigate increment";
          "<Ctrl-Alt-p>" = "print";
          "<Ctrl-B>" = "scroll-page 0 -1";
          "<Ctrl-D>" = "scroll-page 0 0.5";
          "<Ctrl-F5>" = "reload -f";
          "<Ctrl-F>" = "scroll-page 0 1";
          "<Ctrl-N>" = "open -w";
          "<Ctrl-PgDown>" = "tab-next";
          "<Ctrl-PgUp>" = "tab-prev";
          "<Ctrl-Q>" = "quit";
          "<Ctrl-Return>" = "selection-follow -t";
          "<Ctrl-Shift-N>" = "open -p";
          "<Ctrl-Shift-T>" = "undo";
          "<Ctrl-Shift-Tab>" = "nop";
          "<Ctrl-Shift-W>" = "close";
          "<Ctrl-T>" = "open -t";
          "<Ctrl-Tab>" = "tab-focus last";
          "<Ctrl-U>" = "scroll-page 0 -0.5";
          "<Ctrl-V>" = "mode-enter passthrough";
          "<Ctrl-W>" = "tab-close";
          "<Ctrl-X>" = "navigate decrement";
          "<Ctrl-^>" = "tab-focus last";
          "<Ctrl-h>" = "home";
          "<Ctrl-p>" = "tab-pin";
          "<Ctrl-s>" = "stop";
          "<Escape>" = "clear-keychain ;; search ;; fullscreen --leave";
          "<F11>" = "fullscreen";
          "<F5>" = "reload";
          "<Return>" = "selection-follow";
          "<back>" = "back";
          "<forward>" = "forward";
          "=" = "zoom";
          "?" = "cmd-set-text ?";
          "@" = "macro-run";
          "B" = "cmd-set-text -s :quickmark-load -t";
          "D" = "tab-close -o";
          "F" = "hint all tab";
          "G" = "scroll-to-perc";
          "H" = "back";
          "J" = "tab-next";
          "K" = "tab-prev";
          "L" = "forward";
          "M" = "bookmark-add";
          "N" = "search-prev";
          "O" = "cmd-set-text -s :open -t";
          "PP" = "open -t -- {primary}";
          "Pp" = "open -t -- {clipboard}";
          "R" = "reload -f";
          "Sb" = "bookmark-list --jump";
          "Sh" = "history";
          "Sq" = "bookmark-list";
          "Ss" = "set";
          "T" = "cmd-set-text -sr :tab-focus";
          "U" = "undo -w";
          "V" = "mode-enter caret ;; selection-toggle --line";
          "ZQ" = "quit";
          "ZZ" = "quit --save";
          "[[" = "navigate prev";
          "]]" = "navigate next";
          "`" = "mode-enter set_mark";
          "ad" = "download-cancel";
          "b" = "cmd-set-text -s :quickmark-load";
          "cd" = "download-clear";
          "co" = "tab-only";
          "d" = "tab-close";
          "f" = "hint";
          "g$" = "tab-focus -1";
          "g0" = "tab-focus 1";
          "gB" = "cmd-set-text -s :bookmark-load -t";
          "gC" = "tab-clone";
          "gD" = "tab-give";
          "gJ" = "tab-move +";
          "gK" = "tab-move -";
          "gO" = "cmd-set-text :open -t -r {url:pretty}";
          "gU" = "navigate up -t";
          "g^" = "tab-focus 1";
          "ga" = "open -t";
          "gb" = "cmd-set-text -s :bookmark-load";
          "gd" = "download";
          "gf" = "view-source";
          "gg" = "scroll-to-perc 0";
          "gi" = "hint inputs --first";
          "gm" = "tab-move";
          "go" = "cmd-set-text :open {url:pretty}";
          "gt" = "cmd-set-text -s :tab-select";
          "gu" = "navigate up";
          "h" = "scroll left";
          "i" = "mode-enter insert";
          "j" = "scroll down";
          "k" = "scroll up";
          "l" = "scroll right";
          "m" = "quickmark-save";
          "n" = "search-next";
          "o" = "cmd-set-text -s :open";
          "pP" = "open -- {primary}";
          "pp" = "open -- {clipboard}";
          "q" = "macro-record";
          "r" = "reload";
          "sf" = "save";
          "sk" = "cmd-set-text -s :bind";
          "sl" = "cmd-set-text -s :set -t";
          "ss" = "cmd-set-text -s :set";
          "tCH" = "config-cycle -p -u *://*.{url:host}/* content.cookies.accept all no-3rdparty never ;; reload";
          "tCh" = "config-cycle -p -u *://{url:host}/* content.cookies.accept all no-3rdparty never ;; reload";
          "tCu" = "config-cycle -p -u {url} content.cookies.accept all no-3rdparty never ;; reload";
          "tIH" = "config-cycle -p -u *://*.{url:host}/* content.images ;; reload";
          "tIh" = "config-cycle -p -u *://{url:host}/* content.images ;; reload";
          "tIu" = "config-cycle -p -u {url} content.images ;; reload";
          "tPH" = "config-cycle -p -u *://*.{url:host}/* content.plugins ;; reload";
          "tPh" = "config-cycle -p -u *://{url:host}/* content.plugins ;; reload";
          "tPu" = "config-cycle -p -u {url} content.plugins ;; reload";
          "tSH" = "config-cycle -p -u *://*.{url:host}/* content.javascript.enabled ;; reload";
          "tSu" = "config-cycle -p -u {url} content.javascript.enabled ;; reload";
          "tcH" = "config-cycle -p -t -u *://*.{url:host}/* content.cookies.accept all no-3rdparty never ;; reload";
          "tch" = "config-cycle -p -t -u *://{url:host}/* content.cookies.accept all no-3rdparty never ;; reload";
          "tcu" = "config-cycle -p -t -u {url} content.cookies.accept all no-3rdparty never ;; reload";
          "th" = "back -t";
          "tiH" = "config-cycle -p -t -u *://*.{url:host}/* content.images ;; reload";
          "tih" = "config-cycle -p -t -u *://{url:host}/* content.images ;; reload";
          "tiu" = "config-cycle -p -t -u {url} content.images ;; reload";
          "tl" = "forward -t";
          "tpH" = "config-cycle -p -t -u *://*.{url:host}/* content.plugins ;; reload";
          "tph" = "config-cycle -p -t -u *://{url:host}/* content.plugins ;; reload";
          "tpu" = "config-cycle -p -t -u {url} content.plugins ;; reload";
          "tsH" = "config-cycle -p -t -u *://*.{url:host}/* content.javascript.enabled ;; reload";
          "tsh" = "config-cycle -p -t -u *://{url:host}/* content.javascript.enabled ;; reload";
          "tsu" = "config-cycle -p -t -u {url} content.javascript.enabled ;; reload";
          "u" = "undo";
          "v" = "mode-enter caret";
          "wB" = "cmd-set-text -s :bookmark-load -w";
          "wIf" = "devtools-focus";
          "wIh" = "devtools left";
          "wIj" = "devtools bottom";
          "wIk" = "devtools top";
          "wIl" = "devtools right";
          "wIw" = "devtools window";
          "wO" = "cmd-set-text :open -w {url:pretty}";
          "wP" = "open -w -- {primary}";
          "wb" = "cmd-set-text -s :quickmark-load -w";
          "wf" = "hint all window";
          "wh" = "back -w";
          "wi" = "devtools";
          "wl" = "forward -w";
          "wo" = "cmd-set-text -s :open -w";
          "wp" = "open -w -- {clipboard}";
          "xO" = "cmd-set-text :open -b -r {url:pretty}";
          "xo" = "cmd-set-text -s :open -b";
          "yD" = "yank domain -s";
          "yM" = "yank inline [{title}]({url:yank}) -s";
          "yP" = "yank pretty-url -s";
          "yT" = "yank title -s";
          "yY" = "yank -s";
          "yd" = "yank domain";
          "ym" = "yank inline [{title}]({url:yank})";
          "yp" = "yank pretty-url";
          "yt" = "yank title";
          "yy" = "yank";
          "{{" = "navigate prev -t";
          "}}" = "navigate next -t";
        };
        passthrough = {
          "<Shift-Escape>" = "mode-leave";
        };
        prompt = {
          "<Alt-B>" = "rl-backward-word";
          "<Alt-Backspace>" = "rl-backward-kill-word";
          "<Alt-D>" = "rl-kill-word";
          "<Alt-E>" = "prompt-fileselect-external";
          "<Alt-F>" = "rl-forward-word";
          "<Alt-Shift-Y>" = "prompt-yank --sel";
          "<Alt-Y>" = "prompt-yank";
          "<Ctrl-?>" = "rl-delete-char";
          "<Ctrl-A>" = "rl-beginning-of-line";
          "<Ctrl-B>" = "rl-backward-char";
          "<Ctrl-E>" = "rl-end-of-line";
          "<Ctrl-F>" = "rl-forward-char";
          "<Ctrl-H>" = "rl-backward-delete-char";
          "<Ctrl-K>" = "rl-kill-line";
          "<Ctrl-P>" = "prompt-open-download --pdfjs";
          "<Ctrl-Shift-W>" = "rl-filename-rubout";
          "<Ctrl-U>" = "rl-unix-line-discard";
          "<Ctrl-W>" = "rl-rubout \"";
          "<Ctrl-X>" = "prompt-open-download";
          "<Ctrl-Y>" = "rl-yank";
          "<Down>" = "prompt-item-focus next";
          "<Escape>" = "mode-leave";
          "<Return>" = "prompt-accept";
          "<Shift-Tab>" = "prompt-item-focus prev";
          "<Tab>" = "prompt-item-focus next";
          "<Up>" = "prompt-item-focus prev";
        };
        register = {
          "<Escape>" = "mode-leave";
        };
        yesno = {
          "<Alt-Shift-Y>" = "prompt-yank --sel";
          "<Alt-Y>" = "prompt-yank";
          "<Escape>" = "mode-leave";
          "<Return>" = "prompt-accept";
          "N" = "prompt-accept --save no";
          "Y" = "prompt-accept --save yes";
          "n" = "prompt-accept no";
          "y" = "prompt-accept yes";
        };
      };
      keyMappings = {
        "<Ctrl-6>" = "<Ctrl-^>";
        "<Ctrl-Enter>" = "<Ctrl-Return>";
        "<Ctrl-I>" = "<Tab>";
        "<Ctrl-J>" = "<Return>";
        "<Ctrl-M>" = "<Return>";
        "<Ctrl-[>" = "<Escape>";
        "<Enter>" = "<Return>";
        "<Shift-Enter>" = "<Return>";
        "<Shift-Return>" = "<Return>";
      };
      quickmarks = {
        youtube = "https://www.youtube.com/";
        reddit = "https://www.reddit.com/";
      };
      searchEngines = {
        chatgpt = "https://chat.openai.com/?q={}";
        wa = "https://wiki.archlinux.org/?search={}";
        yt = "https://www.youtube.com/results?search_query={}";
        mynixos = "https://mynixos.com/search?q={}";
        nixpackages = "https://search.nixos.org/packages?query={}";
        nixoptions = "https://search.nixos.org/options?query={}";
      };
      settings = {
        auto_save = {
          interval = 15000;
          session = true;
        };
        backend = "webengine";
        changelog_after_upgrade = "major";
        colors = {
          completion = {
            category = {
              bg = "qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #888888, stop:1 #505050)";
              border = {
                bottom = "black";
                top = "black";
              };
              fg = "white";
            };
            even = {
              bg = "#333333";
            };
            item = {
              selected = {
                bg = "#e8c000";
                border = {
                  bottom = "#bbbb00";
                  top = "#bbbb00";
                };
                fg = "black";
                match = {
                  fg = "#ff4444";
                };
              };
            };
            match = {
              fg = "#ff4444";
            };
            odd = {
              bg = "#444444";
            };
            scrollbar = {
              bg = "#333333";
              fg = "white";
            };
          };
          contextmenu = {
            disabled = {
              # bg = "empty";
              # fg = "empty";
            };
            menu = {
              # bg = "empty";
              # fg = "empty";
            };
            selected = {
              # bg = "empty";
              # fg = "empty";
            };
          };
          downloads = {
            bar = {
              bg = "black";
            };
            error = {
              bg = "black";
              fg = "red";
            };
            start = {
              bg = "#0000aa";
              fg = "white";
            };
            stop = {
              bg = "#00aa00";
              fg = "white";
            };
            system = {
              bg = "rgb";
              fg = "rgb";
            };
          };
          hints = {
            bg = "qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 rgba(255, 247, 133, 0.8), stop:1 rgba(255, 197, 66, 0.8))";
            fg = "black";
            match = {
              fg = "green";
            };
          };
          keyhint = {
            bg = "rgba(0, 0, 0, 80%)";
            fg = "#FFFFFF";
            suffix = {
              fg = "#FFFF00";
            };
          };
          messages = {
            error = {
              bg = "red";
              border = "#bb0000";
              fg = "white";
            };
            info = {
              bg = "black";
              fg = "white";
              border = "#333333";
            };
            warning = {
              bg = "darkorange";
              border = "#d47300";
              fg = "black";
            };
          };
          prompts = {
            bg = "black";
            border = "1px solid gray";
            fg = "#444444";
            selected = {
              bg = "grey";
              fg = "white";
            };
          };
          statusbar = {
            caret = {
              bg = "purple";
              fg = "white";
              selection = {
                bg = "#a12dff";
                fg = "white";
              };
            };
            command = {
              bg = "black";
              fg = "white";
              private = {
                bg = "darkslategray";
                fg = "white";
              };
            };
            insert = {
              bg = "darkgreen";
              fg = "white";
            };
            normal = {
              bg = "black";
              fg = "white";
            };
            passthrough = {
              bg = "darkblue";
              fg = "white";
            };
            private = {
              bg = "#666666";
              fg = "white";
            };
            progress = {
              bg = "white";
            };
            url = {
              error = {
                fg = "orange";
              };
              fg = "white";
              hover = {
                fg = "aqua";
              };
              success = {
                http = {
                  fg = "white";
                };
                https = {
                  fg = "lime";
                };
              };
              warn = {
                fg = "yellow";
              };
            };
          };
          tabs = {
            bar = {
              bg = "#555555";
            };
            even = {
              bg = "darkgrey";
              fg = "white";
            };
            indicator = {
              error = "#ff0000";
              start = "#0000aa";
              stop = "#00aa00";
              system = "rgb";
            };
            odd = {
              bg = "grey";
              fg = "white";
            };
            pinned = {
              even = {
                bg = "darkseagreen";
                fg = "white";
              };
              odd = {
                bg = "seagreen";
                fg = "white";
              };
              selected = {
                even = {
                  bg = "black";
                  fg = "white";
                };
                odd = {
                  bg = "black";
                  fg = "white";
                };
              };
            };
            selected = {
              even = {
                fg = "white";
              };
              odd = {
                bg = "black";
                fg = "white";
              };
            };
          };
          tooltip = {
            # bg = "empty";
            # fg = "empty";
          };

          webpage = {
            bg = "white";
            darkmode = {
              algorithm = "lightness-cielab";
              contrast = 0.0;
              enabled = true;
              policy = {
                images = "smart";
                page = "smart";
              };
              threshold = {
                background = 0;
                foreground = 256;
              };
            };
            preferred_color_scheme = "dark";
          };
        };
        completion = {
          cmd_history_max_items = 100;
          delay = 0;
          favorite_paths = [];
          height = "50%";
          min_chars = 1;
          open_categories = [
            "searchengines"
            "quickmarks"
            "bookmarks"
            "history"
            "filesystem"
          ];
          quick = true;
          scrollbar = {
            padding = 2;
            width = 12;
          };
          show = "always";
          shrink = false;
          timestamp_format = " %Y-%m-%d %H:%M";
          use_best_match = false;
          web_history = {
            exclude = [];
            max_items = -1;
          };
        };
        confirm_quit = ["downloads"];
        content = {
          autoplay = false;
          blocking = {
            adblock = {
              lists = [
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt"
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt"
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt"
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt"
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt"
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt"
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt"
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt "
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt "
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt "
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2025.txt "
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2025.txt "
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-general.txt "
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-mobile.txt "
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt "
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/lan-block.txt "
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt "
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt "
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt "
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt "
                "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt "
              ];
            };
            hosts = {
              block_subdomains = true;
              lists = [
                "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
              ];
            };
          };
          cache = {
            appcache = true;
            maximum_pages = 0;
            size = null;
          };
          canvas_reading = true;
          cookies = {
            accept = "all";
            store = true;
          };
          default_encoding = "iso-8859-1";
          desktop_capture = true;
          dns_prefetch = true;
          frame_flattening = false;
          fullscreen = {
            overlay_timeout = 3000;
            window = false;
          };
          geolocation = true;
          headers = {
            accept_language = "en-US";
            custom = null;
            do_not_track = true;
            referer = "same-domain";
            user_agent = "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version_short} Safari/{webkit_version}";
          };
          hyperlink_auditing = false;
          images = true;
          javascript = {
            alert = true;
            can_close_tabs = false;
            can_open_tabs_automatically = false;
            clipboard = "ask";
            enabled = true;
            legacy_touch_events = "never";
            modal_dialog = false;
            prompt = true;
          };
          local_content_can_access_file_urls = true;
          local_content_can_access_remote_urls = false;
          local_storage = true;
          media = {
            audio_capture = "ask";
            audio_video_capture = "ask";
            video_capture = "ask";
          };
          mouse_lock = "ask";
          mute = false;
          netrc_file = null;
          notifications = {
            enabled = "ask";
            presenter = "auto";
            show_origin = true;
          };
          pdfjs = false;
          persistent_storage = "ask";
          plugins = false;
          prefers_reduced_motion = false;
          print_element_backgrounds = true;
          private_browsing = false;
          proxy = "system";
          register_protocol_handler = "ask";
          site_specific_quirks = {
            enabled = true;
            skip = null;
          };
          tls = {certificate_errors = "ask";};
          unknown_url_scheme_policy = "allow-from-user-interaction";
          user_stylesheets = null;
          webgl = true;
          webrtc_ip_handling_policy = "all-interfaces";
          xss_auditing = false;
        };
        downloads = {
          location = {
            directory = null;
            prompt = true;
            remember = true;
            suggestion = "path";
          };
          open_dispatcher = null;
          position = "bottom";
          prevent_mixed_content = true;
          remove_finished = -1;
        };
        editor = {
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
        fileselect = {
          folder = {
            command = [
              "xterm"
              "-e"
              "ranger"
              "--choosedir={}"
            ];
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
          };
        };
        fonts = {
          completion = {
            category = "bold default_size default_family";
            entry = " default_size default_family";
          };
          contextmenu = null;
          debug_console = "default_size default_family";
          default_family = null;
          default_size = "10pt";
          downloads = "default_size default_family";
          hints = "bold default_size default_family";
          keyhint = "default_size default_family";
          messages = {
            error = "default_size default_family";
            info = "default_size default_family";
            warning = "default_size default_family";
          };
          prompts = "default_size sans-serif";
          statusbar = "default_size default_family";
          tabs = {
            selected = "default_size default_family";
            unselected = "default_size default_family";
          };
          tooltip = null;
          web = {
            family = {
              cursive = null;
              fantasy = null;
              fixed = null;
              sans_serif = null;
              serif = null;
              standard = null;
            };
            size = {
              default = 16;
              default_fixed = 13;
              minimum = 0;
              minimum_logical = 6;
            };
          };
        };
        hints = {
          auto_follow = "unique-match";
          auto_follow_timeout = 0;
          border = "1px solid #E3BE23";
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
            all = [
              "a"
              "area"
              "textarea"
              "select"
              "input:not([type=\"hidden\"])"
              "button"
              "frame"
              "iframe"
              "img"
              "link"
              "summary"
              "[contenteditable]:not([contenteditable=\"false\"])"
              "[onclick]"
              "[onmousedown]"
              "[role=\"link\"]"
              "[role=\"option\"]"
              "[role=\"button\"]"
              "[role=\"tab\"]"
              "[role=\"checkbox\"]"
              "[role=\"switch\"]"
              "[role=\"menuitem\"]"
              "[role=\"menuitemcheckbox\"]"
              "[role=\"menuitemradio\"]"
              "[role=\"treeitem\"]"
              "[aria-haspopup]"
              "[ng-click]"
              "[ngClick]"
              "[data-ng-click]"
              "[x-ng-click]"
              "[tabindex]:not([tabindex=\"/-1\"])"
            ];
            images = [
              "img"
            ];
            inputs = [
              "input[type=\"text\"]"
              "input[type=\"date\"]"
              "input[type=\"datetime-local\"]"
              "input[type=\"email\"]"
              "input[type=\"month\"]"
              "input[type=\"number\"]"
              "input[type=\"password\"]"
              "input[type=\"search\"]"
              "input[type=\"tel\"]"
              "input[type=\"time\"]"
              "input[type=\"url\"]"
              "input[type=\"week\"]"
              "input:not([type])"
              "[contenteditable]:not([contenteditable=\"false\"])"
              "textarea"
            ];
            links = [
              "a[href]"
              "area[href]"
              "link[href]"

              "[role=\"link\"][href]"
            ];
            media = [
              "audio"
              "img"
              "video"
            ];
            url = [
              "[src]"
              "[href]"
            ];
            uppercase = false;
          };
        };
        history_gap_interval = 30;
        input = {
          escape_quits_reporter = true;
          forward_unbound_keys = "auto";
          insert_mode = {
            auto_enter = true;
            auto_leave = true;
            auto_load = true;
            leave_on_load = true;
            plugins = false;
          };
          links_included_in_focus_chain = true;
          match_counts = true;
          media_keys = true;
          mode_override = null;
          mouse = {
            back_forward_buttons = true;
            rocker_gestures = false;
          };
          partial_timeout = 0;
          spatial_navigation = false;
        };
        keyhint = {
          blacklist = null;
          delay = 500;
          radius = 6;
        };
        logging = {
          level = {
            console = "info";
            ram = "info";
          };
        };
        messages.timeout = 3000;
        new_instance_open_target = "tab";
        new_instance_open_target_window = "last-focused";
        prompt = {
          filebrowser = true;
          radius = 8;
        };
        qt = {
          args = null;
          chromium = {
            experimental_web_platform_features = "auto";
            low_end_device_mode = "auto";
            process_model = "process-per-site-instance";
            sandboxing = "enable-all";
          };
          environ = null;
          force_platform = null;
          force_platformtheme = null;
          force_software_rendering = "none";
          highdpi = false;
          workarounds = {
            disable_accelerated_2d_canvas = "auto";
            disable_hangouts_extension = false;
            locale = false;
            remove_service_workers = false;
          };
        };
        scrolling = {
          bar = "overlay";
          smooth = false;
          ignore_case = "smart";
          incremental = true;
          wrap = true;
          wrap_messages = true;
        };
        session = {};
        tabs = {
          background = true;
          favicons.scale = 1.0;
        };
        window.transparent = true;
      };
    };
  };
}
