function _G.toggle_oil()
	if vim.bo.filetype == "oil" then
		require("oil.actions").close.callback()
	else
		vim.cmd("Oil")
	end
end
