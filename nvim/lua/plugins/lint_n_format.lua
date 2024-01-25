return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("FormatOnWrite", {})
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua, -- lua
					null_ls.builtins.diagnostics.luacheck, -- lua
					null_ls.builtins.diagnostics.shellcheck, -- shell
					null_ls.builtins.code_actions.shellcheck, -- shell
					null_ls.builtins.formatting.beautysh, -- shell
					null_ls.builtins.formatting.black, -- python
					null_ls.builtins.formatting.isort, -- python for sorting imports
					null_ls.builtins.diagnostics.yamllint, --yaml
					null_ls.builtins.formatting.prettier, -- yaml, markdown, json, html etc.
					null_ls.builtins.diagnostics.markdownlint, -- markdown
					null_ls.builtins.formatting.markdown_toc, -- markdown
					null_ls.builtins.formatting.format_r, -- R
					null_ls.builtins.formatting.styler, -- R
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						--[[ -- Perform formatting on save.
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            }) ]]
						-- Define a local function to format asynchronously and apply keymap to just this buffer
						local formatfunction = function()
							vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
						end
						vim.keymap.set(
							"n",
							"<leader>fc",
							formatfunction,
							{ desc = "[F]ormat [C]ode asynchronously", buffer = bufnr }
						)
					end
				end,
			})
			-- To format on demand
		end,
	},
}
