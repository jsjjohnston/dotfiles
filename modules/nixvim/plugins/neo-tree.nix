{...}:{
	programs.nixvim.plugins = {
		neo-tree = {enable = true;};
	};
	programs.nixvim = 
	{
		keymaps = [
			{
				mode = ["n"];
				key = "\\";
				action = "<cmd>Neotree toggle<cr>";
				options = {desc = "Open/Close Neotree";};
			}
		];
	};
}
