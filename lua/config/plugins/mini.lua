return {
	{
		"echasnovski/mini.nvim",
		config = function()
            enabled = true
			local statusline = require 'mini.statusline'
			statusline.setup { use_icons = true }
		end
	}
}
