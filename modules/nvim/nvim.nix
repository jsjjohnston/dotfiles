{ lib, config, pkgs, ... }:

{

options = {
nvim.enable = lib.mkEnableOption "enable nvim module";
};

config = lib.mkIf config.nvim.enable {
programs.neovim = {
     enable = true;
     defaultEditor = true;
     viAlias = true;
     vimAlias = true;
     vimdiffAlias = true;
     plugins = [
  {

      plugin = pkgs.vimPlugins.vim-nix; 
      }
    ];
  };
};
 
}

