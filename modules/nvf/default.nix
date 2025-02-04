{ ... }:
{

  programs.nvf = {
    enable = false;
    # your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim.filetree.neo-tree.enable = true;
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };
    };
  };
}
