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
          "bashls",
          "groovyls",
          "yamlls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- require("neodev").setup({})
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
      lspconfig.nextflow_ls.setup({ capabilities = capabilities })
      lspconfig.r_language_server.setup({ capabilities = capabilities })
      lspconfig.pylsp.setup({ capabilities = capabilities })
      -- lspconfig.jedi_language_server.setup({ capabilities = capabilities })
      lspconfig.groovyls.setup({ capabilities = capabilities })
      lspconfig.yamlls.setup({ capabilities = capabilities })
      lspconfig.bashls.setup({ capabilities = capabilities })
      lspconfig.taplo.setup({ capabilities = capabilities })
      lspconfig.lua_ls.setup({ capabilities = capabilities })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Buffer Hover" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "[G]o to [I]mplementation" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efintion" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
      vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "[C]ode [D]iagnostics" })
      vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "[D]iagnostics [P]rev" })
      vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "[D]iagnostics [N]ext" })
      vim.keymap.set("n", "<leader>rv", vim.lsp.buf.rename, { desc = "[R]ename [V]ariable " })
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "jmbuhr/otter.nvim", -- This is to allow for LSP running in code blocks
    config = function()
      require("otter").setup()
    end,
  },
}
