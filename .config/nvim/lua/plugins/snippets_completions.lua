return {
	{ "hrsh7th/cmp-nvim-lsp" }, -- use LSP sources for nvim
	{ "hrsh7th/cmp-buffer" }, -- use words from the buffer
	{ "hrsh7th/cmp-path" }, -- detect path and suggest completions
	{ "onsails/lspkind.nvim" }, -- add info in the menu about the source
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			local ls = require("luasnip")
			--[[ vim.keymap.set({ "i" }, "<C-I>", function()
				ls.expand()
			end, { silent = true, desc = "[I]nsert [S]nippet", remap = false }) ]]
			-- This causes problems with Tab because alacritty send Tab and C-I same thing
			vim.keymap.set({ "i", "s" }, "<C-L>", function()
				ls.jump(1)
			end, { silent = true, desc = "Jump to next snippet field" })
			vim.keymap.set({ "i", "s" }, "<C-H>", function()
				ls.jump(-1)
			end, { silent = true, desc = "Jump to previous snippet field" })
			vim.keymap.set({ "i", "s" }, "<C-E>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true, desc = "Change snippet node" })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-E>"] = cmp.mapping.abort(),
					["<C-I>"] = cmp.mapping.confirm({ select = true }),
					["<C-K>"] = cmp.mapping.select_prev_item(),
					["<C-J>"] = cmp.mapping.select_next_item(),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lua" },
					{ name = "luasnip", max_item_count = 2 },
					{ name = "nvim_lsp", max_item_count = 5 },
					{ name = "buffer", max_item_count = 3, option = { keyword_length = 5 } },
				}),
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						menu = {
							luasnip = "[Snip]",
							nvim_lua = "[Lua]",
							nvim_lsp = "[LSP]",
							buffer = "[Buf]",
						},
					}),
				},
				experimental = { ghost_text = true },
				view = {
					entries = { name = "custom", selection_order = "near_cursor" },
				},
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer", max_item_count = 3 },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path", max_item_count = 3 },
				}, {
					{ name = "cmdline", max_item_count = 3 },
				}),
			})
		end,
	},
}
