return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      -- First get rid of default vim folding
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
      vim.keymap.set("n", "z1", function()
        require("ufo").closeFoldsWith(0)
      end, { desc = "Set fold level to 0" })
      vim.keymap.set("n", "z2", function()
        require("ufo").closeFoldsWith(1)
      end, { desc = "Set fold level to 1" })
      vim.keymap.set("n", "z3", function()
        require("ufo").closeFoldsWith(2)
      end, { desc = "Set fold level to 2" })
      vim.keymap.set("n", "z4", function()
        require("ufo").closeFoldsWith(3)
      end, { desc = "Set fold level to 3" })
      vim.keymap.set("n", "z5", function()
        require("ufo").closeFoldsWith(4)
      end, { desc = "Set fold level to 4" })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require("lspconfig")[ls].setup({
          capabilities = capabilities,
          -- you can add other fields for setting up lsp server in this table
        })
      end
      require("ufo").setup()
    end,
  },
}
