{
  programs.qutebrowser.settings.url = {
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
}
