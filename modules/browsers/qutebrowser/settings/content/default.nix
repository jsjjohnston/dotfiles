{
  programs.qutebrowser.settings.content = {
    autoplay = false;
    blocking = {
      enabled = true;
      method = "auto";
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
      appcache = false;
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
      window = true;
    };
    geolocation = true;
    headers = {
      accept_language = "en-US";
      custom = null;
      do_not_track = true;
      referer = "same-domain";
      user_agent = "Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version_short} Safari/{webkit_version}";
    };
    hyperlink_auditing = true;
    images = true;
    javascript = {
      alert = true;
      can_close_tabs = false;
      can_open_tabs_automatically = false;
      clipboard = "access-paste";
      enabled = true;
      legacy_touch_events = "never";
      modal_dialog = false;
      prompt = true;
    };
    local_content_can_access_file_urls = true;
    local_content_can_access_remote_urls = false;
    local_storage = true;
    media = {
      audio_capture = true;
      audio_video_capture = true;
      video_capture = true;
    };
    mouse_lock = "ask";
    mute = true;
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
}
