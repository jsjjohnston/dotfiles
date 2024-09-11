{lib, pkgs, ...}: {
  imports = [
	./plugins/neo-tree.nix
	./plugins/lsp.nix
	./plugins/colorschemes/cyberdream.nix
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    enableMan = true;

    globals = {
	mapleader = " ";
	maplocalleader = " ";
	have_nerd_font = true;

	NERDTreeShowHidden = 1;
    };

    performance = {
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "hmts.nvim"
          "nvim-treesitter"
        ];
      };
      byteCompileLua.enable = true;
    };
        plugins = {
	
	conform-nvim = {enable = true;
	settings = {
		formatters_by_ft = {
	 nix = ["alejandra"];
	};
	formatters = {
	alejandra = {
            command = "${lib.getExe pkgs.alejandra}";
          };
	};
	};
	};
    };
    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
