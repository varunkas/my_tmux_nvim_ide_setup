return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			integrations = {
				markdown = true,
				cmp = true,
				harpoon = true,
				neotree = true,
				treesitter = true,
				notify = false,
				mason = true,
				ufo = true,
			},
			background = {
				light = "latte",
				-- dark = "mocha",
			},
			-- transparent_background = false,
			show_end_of_buffer = true,
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
