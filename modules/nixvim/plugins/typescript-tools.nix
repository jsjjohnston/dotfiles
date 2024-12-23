{ pkgs, ... }:
{
  programs.nixvim.plugins.typescript-tools = {
    enable = true;
    settings = {
      tsserver_path = pkgs.typescript;
      expose_as_code_action = [
        "fix_all"
        "add_missing_imports"
        "remove_unused"
        "remove_unused_imports"
        "organize_imports"
        "insert_leave"
      ];
      complete_function_calls = true;
      tsserver_max_memory = "auto";
      jsx_close_tag.enable = true;
      tsserver_file_preferences = {
        disable_suggestions = false;
        quote_preference = "auto";
        include_completions_for_module_exports = true;
        include_completions_for_import_statements = true;
        include_completions_with_snippet_text = true;
        include_completions_with_insert_text = true;
        include_automatic_optional_chain_completions = true;
        include_inlay_parameter_name_hints = "all";
        provide_refactor_not_applicable_reason = true;
        allow_rename_of_import_path = true;
      };
    };
  };
}
