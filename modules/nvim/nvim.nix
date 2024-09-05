{ lib, config, pkg };

{

options = {
nvim.enable = lib.mkEnableOption "enable nvim module";
};

config = lib.mkif config.nvim.enable {
programs.neovim = {
     enable = true;
		#extraConfig = lib.fileContents ./nvim/init.lua;
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

