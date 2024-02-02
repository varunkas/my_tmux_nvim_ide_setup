return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			default_component_configs = {
				container = {
					enable_character_fade = true,
				},
				indent = {
					indent_size = 2,
				},
			},
			window = {
				position = "float",
				width = 50,
				-- Add a custom mapping to copy path of a file from the tree
				mappings = {
					["<space>"] = {
						"toggle_node",
						nowait = true,
					},
					["a"] = {
						"add",
						-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
						-- some commands may take optional config options, see `:h neo-tree-mappings` for details
						config = {
							show_path = "relative", -- "none", "relative", "absolute"
						},
					},
					["Y"] = function(state)
						-- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
						-- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
						local node = state.tree:get_node()
						local filepath = node:get_id()
						local filename = node.name
						local modify = vim.fn.fnamemodify

						local results = {
							filepath,
							modify(filepath, ":."),
							modify(filepath, ":~"),
							filename,
							modify(filename, ":r"),
							modify(filename, ":e"),
						}

						-- absolute path to clipboard
						local i = vim.fn.inputlist({
							"Choose to copy to system clipboard:",
							"1. Absolute path: " .. results[1],
							"2. Path relative to CWD: " .. results[2],
							"3. Path relative to HOME: " .. results[3],
							"4. Filename: " .. results[4],
							"5. Filename without extension: " .. results[5],
							"6. Extension of the filename: " .. results[6],
						})

						if i > 0 then
							local result = results[i]
							if not result then
								return print("Invalid choice: " .. i)
							end
							vim.fn.setreg("*", result)
							vim.notify("\nCopied: " .. result)
						end
					end,
				},
			},
		})
		vim.keymap.set("n", "<leader>e", ":Neotree toggle <CR>", { noremap = true })
	end,
}
