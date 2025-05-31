{
  imports = [
    ./aliases.nix
    ./enableDefaultBindings.nix
    ./settings/greasemonkey.nix
    ./keyMappings.nix
    ./keyBindings/caret.nix
    ./keyBindings/command.nix
    ./keyBindings/hint.nix
    ./keyBindings/insert.nix
    ./keyBindings/normal.nix
    ./keyBindings/passthrough.nix
    ./keyBindings/prompt.nix
    ./keyBindings/register.nix
    ./keyBindings/yesno.nix
    ./quickmarks.nix
    ./searchEngines.nix
    ./settings/auto_save.nix
    ./colors.nix
    ./completion
  ];
  programs = {
    qutebrowser = {
      enable = true;
      loadAutoconfig = false;
      settings = {
        backend = "webengine";
        changelog_after_upgrade = "major";
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
        # fileselect = {
        #   folder = {
        #     command = [
        #       "xterm"
        #       "-e"
        #       "ranger"
        #       "--choosedir={}"
        #     ];
        #     handler = "default";
        #     multiple_files = {
        #       command = [
        #         "xterm"
        #         "-e"
        #         "ranger"
        #         "--choosefiles={}"
        #       ];
        #     };
        #     single_file = {
        #       command = [
        #         "xterm"
        #         "-e"
        #         "ranger"
        #         "--choosefiles={}"
        #       ];
        #     };
        #   };
        # };
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
        # hints = {
        #   auto_follow = "unique-match";
        #   auto_follow_timeout = 0;
        #   border = "1px solid E3BE23";
        #   chars = "asdfghjkl";
        #   dictionary = "/usr/share/dict/words";
        #   find_implementation = "python";
        #   hide_unmatched_rapid_hints = true;
        #   leave_on_load = false;
        #   min_chars = 1;
        #   mode = "letter";
        #   next_regexes = [
        #     "\bnext\b"
        #     "\bmore\b"
        #     "\bnewer\b"
        #     "\b[>→≫]\b"
        #     "\b(>>|»)\b"
        #     "\bcontinue\b"
        #   ];
        #   padding = [];
        #   prev_regexes = [
        #     "\bprev(ious)?\b"
        #     "\bback\b"
        #     "\bolder\b"
        #     "\b[<←≪]\b"
        #     "\b(<<|«)\b"
        #   ];
        #   radius = 3;
        #   scatter = true;
        #   # selectors = {
        #   #   all = [
        #   #     "a"
        #   #     "area"
        #   #     "textarea"
        #   #     "select"
        #   #     "input:not([type=\"hidden\"])"
        #   #     "button"
        #   #     "frame"
        #   #     "iframe"
        #   #     "img"
        #   #     "link"
        #   #     "summary"
        #   #     "[contenteditable]:not([contenteditable=\"false\"])"
        #   #     "[onclick]"
        #   #     "[onmousedown]"
        #   #     "[role=\"link\"]"
        #   #     "[role=\"option\"]"
        #   #     "[role=\"button\"]"
        #   #     "[role=\"tab\"]"
        #   #     "[role=\"checkbox\"]"
        #   #     "[role=\"switch\"]"
        #   #     "[role=\"menuitem\"]"
        #   #     "[role=\"menuitemcheckbox\"]"
        #   #     "[role=\"menuitemradio\"]"
        #   #     "[role=\"treeitem\"]"
        #   #     "[aria-haspopup]"
        #   #     "[ng-click]"
        #   #     "[ngClick]"
        #   #     "[data-ng-click]"
        #   #     "[x-ng-click]"
        #   #     # "[tabindex]:not([tabindex=\"/-1\"])"
        #   #   ];
        #   #   images = [
        #   #     "img"
        #   #   ];
        #   #   inputs = [
        #   #     "input[type=\"text\"]"
        #   #     "input[type=\"date\"]"
        #   #     "input[type=\"datetime-local\"]"
        #   #     "input[type=\"email\"]"
        #   #     "input[type=\"month\"]"
        #   #     "input[type=\"number\"]"
        #   #     "input[type=\"password\"]"
        #   #     "input[type=\"search\"]"
        #   #     "input[type=\"tel\"]"
        #   #     "input[type=\"time\"]"
        #   #     "input[type=\"url\"]"
        #   #     "input[type=\"week\"]"
        #   #     "input:not([type])"
        #   #     "[contenteditable]:not([contenteditable=\"false\"])"
        #   #     "textarea"
        #   #   ];
        #   #   links = [
        #   #     "a[href]"
        #   #     "area[href]"
        #   #     "link[href]"
        #   #
        #   #     "[role=\"link\"][href]"
        #   #   ];
        #   #   media = [
        #   #     "audio"
        #   #     "img"
        #   #     "video"
        #   #   ];
        #   #   url = [
        #   #     "[src]"
        #   #     "[href]"
        #   #   ];
        #   #   uppercase = false;
        #   # };
        # };
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
        # scrolling = {
        #   bar = "overlay";
        #   smooth = false;
        #   ignore_case = "smart";
        #   incremental = true;
        #   wrap = true;
        #   wrap_messages = true;
        # };
        search = {
          ignore_case = "smart";
          incremental = true;
          wrap = true;
          wrap_messages = true;
        };
        session = {
          # wrap_messages = null;
          lazy_restore = false;
        };
        spellcheck = {
          languages = [
            "en-AU"
          ];
        };
        # statusbar = {
        #   padding = {
        #     bottom = 1;
        #     left = 0;
        #     right = 0;
        #     top = 1;
        #   };
        #   position = "bottom";
        #   show = "always";
        #   widgets = [
        #     "keypress"
        #     "search_match"
        #     "url"
        #     "scroll"
        #     "history"
        #     "tabs"
        #     "progress"
        #   ];
        # };
        # tabs = {
        #   background = true;
        #   close_mouse_button = "middle";
        #   close_mouse_button_on_bar = "new-tab";
        #   favicons = {
        #     scale = 1.0;
        #     show = "always";
        #   };
        #   focus_stack_size = 10;
        #   indicator = {
        #     padding = {
        #       bottom = 2;
        #       left = 0;
        #       right = 4;
        #       top = 2;
        #     };
        #
        #     indicator = {
        #       width = 3;
        #     };
        #   };
        #   last_close = "ignore";
        #   max_width = -1;
        #   min_width = -1;
        #   mode_on_change = "normal";
        #   mousewheel_switching = true;
        #   new_position = {
        #     related = "next";
        #     stacking = true;
        #     unrelated = "last";
        #   };
        #   padding = {
        #     bottom = 0;
        #     left = 5;
        #     right = 5;
        #     top = 0;
        #   };
        #   pinned = {
        #     frozen = true;
        #     shrink = true;
        #   };
        #   position = "top";
        #   select_on_remove = "next";
        #   show = "always";
        #   show_switching_delay = 800;
        #   tabs_are_windows = false;
        #   title = {
        #     alignment = "left";
        #     elide = "right";
        #     format = "{audio}{index}: {current_title}";
        #     format_pinned = "{index}";
        #   };
        #   tooltips = true;
        #   undo_stack_size = 100;
        #   width = "15%";
        #   wrap = true;
        # };
        url = {
          auto_search = "naive";
          default_page = "https://start.duckduckgo.com/";
          incdec_segments = [
            "path"
            "query"
          ];
          open_base_url = false;
          # searchengines = {
          #   DEFAULT = "https://duckduckgo.com/?q={}";
          # };
          start_pages = ["https://start.duckduckgo.com"];
          yank_ignored_parameters = [
            "ref"
            "utm_source"
            "utm_medium"
            "utm_campaign"
            "utm_term"
            "utm_content"
            "utm_name"
          ];
        };
        window = {
          hide_decoration = false;
          title_format = "{perc}{current_title}{title_sep}qutebrowser";
          transparent = false;
        };
        zoom = {
          default = "100%";
          levels = [
            "25%"
            "33%"
            "50%"
            "67%"
            "75%"
            "90%"
            "100%"
            "110%"
            "125%"
            "150%"
            "175%"
            "200%"
            "250%"
            "300%"
            "400%"
            "500%"
          ];
          mouse_divider = 512;
          text_only = false;
        };
      };
    };
  };
}
