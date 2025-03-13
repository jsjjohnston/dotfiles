{
  pkgs,
  inputs,
  config,
  ...
}: let
  gdk = pkgs.google-cloud-sdk.withExtraComponents (
    with pkgs.google-cloud-sdk.components; [
      gke-gcloud-auth-plugin
    ]
  );
in {
  imports = [
    inputs.sops-nix.darwinModules.sops
  ];
  sops = {
    defaultSopsFile = ../../secrets/secret.yaml;
    age.keyFile = "/Users/jay/.config/sops/age/keys.txt";
  };

  nixpkgs.config = {
    allowBroken = true; # NOTE: To allow ghostty config until its supported in nixpkgs
    allowUnfree = true;
  };
  environment = {
    systemPackages = with pkgs; [
      terraform
      awscli2
      aws-vault
      bat
      jq
      ripgrep
      typescript-language-server
      lazygit
      terraform-ls
      delta
      eslint_d
      typescript
      python39
      gdk
      nixd
      nil
      bash
      slack
      youtube-music
      unixtools.watch
      ffmpeg
      lazycli
      wtfutil
      sops
      clipse
      arc-browser
      yq
      ncdu
    ];

    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
    pathsToLink = ["/share/bash-completion"];

    shellAliases = {
      build = "darwin-rebuild switch --flake ~/dotfiles/hosts/work-laptop/#work-laptop";
      update = "nix flake update --flake ~/dotfiles/hosts/work-laptop/";
      cat = "bat";
      gh-deploy = "gh workflow run --ref=`git branch --show-current`";
    };

    shells = [pkgs.bashInteractive];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    noto-fonts-emoji
    font-awesome_6
    fira-code
    fira-code-symbols
  ];
  nix = {
    settings = {
      experimental-features = "nix-command flakes";

      ssl-cert-file = "/etc/nix/ca_cert.pem";

      trusted-users = [
        "root"
        "jay"
        "@wheel"
      ];
    };
    linux-builder.enable = true;
    linux-builder.systems = ["aarch64-linux"];

    gc = {
      automatic = true;
      interval = {
        Hour = 13;
        Minute = 15;
      };
      options = "--max-freed $((64 * 1024**3))";
    };

    optimise = {
      automatic = true;
      interval = {
        Hour = 12;
        Minute = 15;
      };
    };
    package = pkgs.nix;
  };
  system = {
    activationScripts = {
      "clipse" = {
        enable = true;
        text =
          /*
          bash
          */
          ''
            clipse -listen
          '';
      };
      "ssl-ca-cert-fix" = {
        enable = true;
        text = ''
          if [ ! -f /etc/nix/ca_cert.pem ]; then
              security export -t certs -f pemseq -k /Library/Keychains/System.keychain -o /tmp/certs-system.pem
              security export -t certs -f pemseq -k /System/Library/Keychains/SystemRootCertificates.keychain -o /tmp/certs-root.pem
              cat /tmp/certs-root.pem /tmp/certs-system.pem > /tmp/ca_cert.pem
              sudo mv /tmp/ca_cert.pem /etc/nix/
          fi
        '';
      };
    };
    defaults = {
      screencapture.target = "preview";
      ActivityMonitor = {
        IconType = 5;
        OpenMainWindow = true;
        ShowCategory = 100;
        SortColumn = "CPUUsage";
        SortDirection = 0;
      };
      LaunchServices.LSQuarantine = false;
      NSGlobalDomain = {
        AppleEnableMouseSwipeNavigateWithScrolls = true;
        AppleEnableSwipeNavigateWithScrolls = true;
        AppleFontSmoothing = 1;
        AppleICUForce24HourTime = false;
        AppleInterfaceStyle = "Dark"; # ALWAYS DARK MODE
        AppleInterfaceStyleSwitchesAutomatically = false;
        AppleKeyboardUIMode = null;
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = 1;
        ApplePressAndHoldEnabled = true;
        AppleScrollerPagingBehavior = true;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        AppleShowScrollBars = "Always";
        AppleSpacesSwitchOnActivate = true;
        AppleTemperatureUnit = "Celsius";
        AppleWindowTabbingMode = "fullscreen";
        NSAutomaticCapitalizationEnabled = true;
        NSAutomaticDashSubstitutionEnabled = true;
        NSAutomaticInlinePredictionEnabled = true;
        NSAutomaticPeriodSubstitutionEnabled = true;
        NSAutomaticQuoteSubstitutionEnabled = true;
        NSAutomaticSpellingCorrectionEnabled = true;
        NSAutomaticWindowAnimationsEnabled = true;
        NSDisableAutomaticTermination = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSNavPanelExpandedStateForSaveMode = false;
        NSNavPanelExpandedStateForSaveMode2 = true;
        NSScrollAnimationEnabled = true;
        NSTableViewDefaultSizeMode = 2; # 1 (small), 2 (medium) or 3 (large). The default is 3.
        NSTextShowsControlCharacters = true;
        NSUseAnimatedFocusRing = true;
        NSWindowResizeTime = 0.2;
        NSWindowShouldDragOnGesture = true;
        PMPrintingExpandedStateForPrint = false;
        PMPrintingExpandedStateForPrint2 = true;
        _HIHideMenuBar = true;
        "com.apple.keyboard.fnState" = true;
        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.sound.beep.feedback" = 1;
        "com.apple.springing.delay" = 0.5;
        "com.apple.springing.enabled" = true;
        "com.apple.trackpad.enableSecondaryClick" = true;
        "com.apple.trackpad.forceClick" = true;
        "com.apple.trackpad.scaling" = 0.5;
        "com.apple.trackpad.trackpadCornerClickBehavior" = 1;
      };
      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      WindowManager = {
        AppWindowGroupingBehavior = true;
        AutoHide = true;
        EnableStandardClickToShowDesktop = false;
        EnableTiledWindowMargins = true;
        GloballyEnabled = false; # NOTE: Don't enable it you wont like it
        HideDesktop = true;
        StageManagerHideWidgets = true;
        StandardHideDesktopIcons = true;
        StandardHideWidgets = true;
      };
      alf = {
        allowdownloadsignedenabled = null;
        allowsignedenabled = null;
        globalstate = null;
        loggingenabled = null;
        stealthenabled = null;
      };
      controlcenter = {
        AirDrop = null;
        BatteryShowPercentage = true;
        Bluetooth = true;
        Display = null;
        FocusModes = true;
        NowPlaying = true;
        Sound = true;
      };
      dock = {
        enable-spring-load-actions-on-all-items = null;
        appswitcher-all-displays = null;
        autohide = true;
        autohide-delay = 0.25;
        autohide-time-modifier = 1.0;
        dashboard-in-overlay = true;
        expose-animation-duration = 0.5;
        expose-group-apps = true;
        largesize = 128;
        launchanim = true;
        magnification = true;
        mineffect = "genie";
        minimize-to-application = true;
        mouse-over-hilite-stack = null;
        mru-spaces = false;
        orientation = "bottom";
        persistent-apps = [
          "/Applications/Ghostty.app"
          "/Applications/Nix Apps/Google Chrome.app"
        ];
        persistent-others = [];
        scroll-to-open = null;
        show-process-indicators = null;
        show-recents = false;
        showhidden = true;
        slow-motion-allowed = true;
        static-only = true;
        tilesize = null;
        wvous-bl-corner = 13;
        wvous-br-corner = 3;
        wvous-tl-corner = 7;
        wvous-tr-corner = 11;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = true;
        FXDefaultSearchScope = null;
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "Nlsv";
        FXRemoveOldTrashItems = true;
        NewWindowTarget = "Computer";
        NewWindowTargetPath = null;
        QuitMenuItem = true;
        ShowExternalHardDrivesOnDesktop = true;
        ShowHardDrivesOnDesktop = true;
        ShowMountedServersOnDesktop = false;
        ShowPathbar = true;
        ShowRemovableMediaOnDesktop = true;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = false;
        _FXSortFoldersFirst = true;
        _FXSortFoldersFirstOnDesktop = true;
      };
      trackpad = {
        TrackpadRightClick = true;
        # NOTE: To enable "Secondary Click" as "Click in bottom-right corner" through the UI:
        # 1. Open "System Settings" from the Apple menu .
        # 2. Navigate to "Trackpad" settings.
        # 3. In the "Point & Click" tab, enable "Secondary click" and select "Click in bottom-right corner".
      };
    };
    startup.chime = false;

    stateVersion = 5;
  };

  security.pki.certificates = [
    "/etc/nix/ca_cert.pem"
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      upgrade = true;
    };
    casks = [
      {
        name = "lookaway";
        greedy = true;
      }
      {
        name = "ghostty";
      }
      {
        name = "docker";
      }
    ];
  };

  time.timeZone = "Australia/Melbourne";

  programs.direnv = {
    enable = true;
  };
  services = {
    openssh.enable = false;
    yabai = {
      enable = true;
      extraConfig = "
      yabai -m rule --add app='System Settings' space=3
      ";
      config = {
        menubar_opacity = 1.0;
        mouse_follows_focus = false;
        focus_follows_mouse = false;
        display_arrangement_order = "default";
        window_origin_display = "default";
        window_placement = "second_child";
        window_insertion_point = "focused";
        window_animation_duration = 0.0;
        window_animation_easing = "ease_out_circ";
        window_opacity_duration = 0.0;
        active_window_opacity = 1.0;
        normal_window_opacity = 0.9;
        window_opacity = true;
        insert_feedback_color = "0xffd75f5f";
        split_ratio = 0.50;
        split_type = "auto";
        auto_balance = true;
        top_padding = 12;
        bottom_padding = 12;
        left_padding = 12;
        right_padding = 12;

        window_gap = 6;
        mouse_modifier = "fn";
        mouse_action1 = "move";
        mouse_action2 = "resize";
        mouse_drop_action = "swap";
        window_zoom_persist = true;
        window_shadow = true;
        layout = "bsp";
      };
    };
    skhd = {
      enable = true;
      skhdConfig = ''
        alt - j : yabai -m window --focus stack.next
        alt - k : yabai -m window --focus stack.prev
        cmd + shift - s : open /System/Applications/Utilities/Screenshot.app
      '';
    };
  };

  programs.zsh.enable = false; # default shell on catalina

  nixpkgs.hostPlatform = "aarch64-darwin";
}
