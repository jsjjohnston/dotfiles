function _G.toggle_oil()
	local oil = require("oil")

	if vim.bo.filetype == "oil" then
		require("oil.actions").close.callback()
	elseif vim.bo.buftype ~= "terminal" then
		oil.open()
	end
end
