return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Set keybindings
          map("v", "<leader>sh", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "[S]stage [H]unk" })
          map("v", "<leader>rh", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
          end, { desc = "[R]eset [H]unk" })
          map("n", "<leader>gb", function()
            gs.blame_line({ full = true })
          end, { desc = "[G]it [B]lame" })
          -- map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "[T]oggle [B]lame" })
        end,
      })
    end,
  },
}
