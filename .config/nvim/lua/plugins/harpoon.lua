local map = vim.keymap.set
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		-- Append to harpoon list
		map("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "[A]ppend to Harpoon list" })
		-- Show harpoon list
		map("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "show [H]arpoon" })

		-- Toggle to specific buffers stored within Harpoon list
		map("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "show [H]arpoon" })
		map("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "show [H]arpoon" })
		map("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "show [H]arpoon" })
		map("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "show [H]arpoon" })

		-- Toggle previous & next buffers stored within Harpoon list
		map("n", "<leader>t", function()
			harpoon:list():prev()
		end, { desc = "Previous Harpoon Item" })
		map("n", "<leader>z", function()
			harpoon:list():next()
		end, { desc = "Next Harpoon Item" })
	end,
}
