return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			integrations = {
				cmp = true,
				harpoon = true,
				gitsigns = true,
				neotree = true,
				treesitter = true,
				notify = false,
				mason = true,
				ufo = true,
			},
			background = {
        -- light = "latte",
				dark = "mocha",
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
