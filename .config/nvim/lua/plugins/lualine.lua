return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				component_separators = "|",
				section_separators = { left = "", right = "" },
				disabled_filetypes = { -- Filetypes to disable lualine for.
					statusline = { "neo-tree" }, -- only ignores the ft for statusline.
					winbar = {},
				},
				--        globalstatus = true
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "encoding", "fileformat" },
				lualine_y = { "filetype" },
				lualine_z = {
					{ "progress", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { { "filename", path = 1 } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "filetype" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
