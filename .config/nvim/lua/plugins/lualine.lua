return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",
        component_separators = "|",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {       -- Filetypes to disable lualine for.
          statusline = { "neo-tree", "man" }, -- only ignores the ft for statusline.
          winbar = { "man" },
        },
        globalstatus = false,
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat" },
        lualine_y = { "filetype" },
        lualine_z = {
          { "progress", left_padding = 2, right_padding = 0 },
          { "location", separator = { right = "" }, left_padding = 0 },
        },
      },
      inactive_sections = {
        lualine_a = { { "filename", path = 1 } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}
