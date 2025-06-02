{
  programs.qutebrowser.settings.qt = {
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
}
