local m = {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = {
				enabled = true, -- keep lexical scope highlighting
				show_start = true,
				show_end = false,
				-- you can tweak the group in your colorscheme
				highlight = { "IblScope" },
			},
		},
	},
	{ "nvim-mini/mini.nvim", version = false },
}

m[2].config = function()
	local mini_indentscope = require("mini.indentscope")
	mini_indentscope.setup({
		draw = {
			delay = 1,
			-- animation = false,
			priority = 2,
		},
	})
	mini_indentscope.gen_animation.none()
end

return m
