return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			-- local augroup = vim.api.nvim_create_augroup("FormatOnWrite", {})
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua, -- lua
					null_ls.builtins.diagnostics.selene.with({
						only_local = "/Users/sreenivasan/.cargo/bin/selene", -- This is becase as of June 2024, Mason was not installing MacOS compatible selene executable
					}), -- lua
					null_ls.builtins.formatting.shfmt, -- shell
					null_ls.builtins.formatting.black, -- python
					null_ls.builtins.formatting.isort, -- python for sorting imports
					null_ls.builtins.diagnostics.yamllint.with({
						extra_args = { "-c", vim.fn.expand("~/.config/yamllint/config.yaml") },
					}), --yaml
					null_ls.builtins.formatting.yamlfmt, --yaml
					null_ls.builtins.formatting.prettier.with({
						disabled_filetypes = { "yaml" }, --[[ "markdown"  ]]
						extra_filetypes = { "toml" },
					}), -- yaml, markdown, json, html etc.
					null_ls.builtins.diagnostics.markdownlint.with({
						extra_args = { "--disable", "MD013" },
					}), -- markdown
					-- null_ls.builtins.formatting.format_r, -- R
					null_ls.builtins.formatting.styler, -- R
				},
			})
		end,
	},
}
