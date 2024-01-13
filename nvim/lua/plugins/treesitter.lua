return {
  {"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "r", "python", "bash", "markdown", "yaml", "json" },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local config = require('nvim-treesitter.configs')
      config.setup({
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = { query = "@function.outer", dec = "Select outer part of a function" },
              ["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
              ["aa"] = { query = "@assignment.outer", desc = "Selection outer part of an assignment" },
              ["ia"] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
              ["ra"] = { query = "@assignment.rhs", desc = "Select right part of an assignment" },
              ["la"] = { query = "@assignment.lhs", desc = "Select left part of an assignment" },
              -- You can also use captures from other query groups like `locals.scm`
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
              ['@assignment.outer'] = 'V', -- charwise
              ['@function.outer'] = 'V', -- linewise
              ['@scope'] = 'V', -- linewise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = false,
          }
        }
      })
    end
  }
}
