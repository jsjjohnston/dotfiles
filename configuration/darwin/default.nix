{
  imports = [
    ./homebrew.nix
  ];
  system = {
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
  };
}
