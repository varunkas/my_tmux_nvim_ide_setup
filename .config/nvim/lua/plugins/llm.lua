return {
	{
		"jpmcb/nvim-llama",
    lazy = true,
    cmd = "Llama",
		config = function()
			require("nvim-llama").setup({
				-- See plugin debugging logs
				debug = false,
				-- Choose one of the 3B models, which requires 8GB RAM
				model = "orca-mini",
			})
		end,
	},
}
