return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("FormatOnQuit", {})
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua, -- lua
					null_ls.builtins.completion.spell,
					null_ls.builtins.code_actions.proselint, -- english for Markdown
					null_ls.builtins.formatting.black, -- python
					null_ls.builtins.formatting.isort, -- python for sorting imports
					null_ls.builtins.formatting.prettier, -- yaml, markdown, json, html etc.
				},
				-- Enable format on save. DOES NOT SEEM TO WORK.
				-- Copied partly from https://github.com/nvimtools/none-ls.nvim/wiki/Formatting-on-save
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
			})
			-- To format on demand
			local formatfunction = function()
				vim.lsp.buf.format({ async = false })
			end
			vim.keymap.set("n", "<leader>fc", formatfunction, { desc = "[F]ormat [C]ode " })
		end,
	},
}
