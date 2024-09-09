{lib, pkgs, ...}: {
  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

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
	lsp = {enable = true;

		servers = 
		{
			nil-ls = {enable = true;};
		};
	};
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
