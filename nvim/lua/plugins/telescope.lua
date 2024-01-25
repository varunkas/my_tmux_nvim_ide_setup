return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		config = function()
			-- Load the fzf extension
			require("telescope").load_extension("fzf")
			-- setup Telescope with its keymappings
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch for [F]ile using Telescope" })
			vim.keymap.set(
				"n",
				"<leader><space>",
				builtin.buffers,
				{ desc = "[ ] Find existing buffers using Telescop" }
			)
			vim.keymap.set("n", "<leader>gf", builtin.live_grep, { desc = "[G]rep [F]iles using Telescop" })
			vim.keymap.set(
				"n",
				"<leader>gh",
				require("telescope.builtin").help_tags,
				{ desc = "[G]rep [H]elp using Telescop" }
			)
			vim.keymap.set(
				"n",
				"<leader>gk",
				require("telescope.builtin").keymaps,
				{ desc = "[G]rep [K]keymaps using Telescop" }
			)
			vim.keymap.set("n", "<leader>/", function()
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
