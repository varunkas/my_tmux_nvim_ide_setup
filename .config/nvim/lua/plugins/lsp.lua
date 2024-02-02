return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"r_language_server",
					"pylsp",
					-- "hydra_lsp",
					"jedi_language_server",
					"groovyls",
					"yamlls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("neodev").setup({})
			local capabilities = require("cmp_nvim_lsp").default_capabilities() -- This is for autocompletion
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})
			lspconfig.r_language_server.setup({ capabilities = capabilities })
			lspconfig.pylsp.setup({ capabilities = capabilities })
			-- lspconfig.hydra_lsp.setup({ capabilities = capabilities })
			lspconfig.jedi_language_server.setup({ capabilities = capabilities })
			lspconfig.groovyls.setup({ capabilities = capabilities })
			lspconfig.yamlls.setup({ capabilities = capabilities })
			lspconfig.taplo.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "[G]o to [I]mplementation" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efintion" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
			vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "[C]ode [D]iagnostics" })
			vim.keymap.set("n", "<leader>vr", vim.lsp.buf.rename, { desc = "[V]ariable [R]ename" })
		end,
	},
	{ "folke/neodev.nvim", opts = {} },
}
