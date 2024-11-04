{ ... }:
{
  programs.nixvim.plugins.typescript-tools = {
    enable = true;

    settings = {
      exposeAsCodeAction = [
        "fix_all"
        "add_missing_imports"
        "remove_unused"
        "remove_unused_imports"
        "organize_imports"
        "insert_leave"
      ];
      completeFunctionCalls = true;
      tsserverMaxMemory = "auto";
      jsxCloseTag.enable = true;
      tsserverFilePreferences = {
        disableSuggestions = false;
        quotePreference = "auto";
        includeCompletionsForModuleExports = true;
        includeCompletionsForImportStatements = true;
        includeCompletionsWithSnippetText = true;
        includeCompletionsWithInsertText = true;
        includeAutomaticOptionalChainCompletions = true;
        includeInlayParameterNameHints = "all";
        provideRefactorNotApplicableReason = true;
        allowRenameOfImportPath = true;
      };
    };
  };
}
