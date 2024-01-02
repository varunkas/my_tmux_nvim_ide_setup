-- These lines have been selectively copied from my forked git repo kickstarter.vim. See (https://github.com/varunkas/kickstart.nvim/blob/master/init.lua)
-- Read the readme.md as well as the comments in the init.lua in kickstart-nvim repo

-- SETUP nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager. This automatically pulls the gitrepo
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({

    -- NOTE: First, some plugins that don't require any configuration

    -- Git related plugins
    'tpope/vim-fugitive',

    -- syntax highlighting for nextflow and related files
    'varunkas/nextflow-vim',

    -- file explorer alternative of netrw
    'nvim-tree/nvim-tree.lua',
    -- also requires nerd font setup to view the file tree properly
    'nvim-tree/nvim-web-devicons',

    {
	-- Theme inspired by Atom
	'navarasu/onedark.nvim',
	priority = 1000
    },

    --  LSP setup
    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    {
	-- LSP Configuration & Plugins
	'neovim/nvim-lspconfig',
	dependencies = {
	    -- Automatically install LSPs to stdpath for neovim
	    'williamboman/mason.nvim',
	    'williamboman/mason-lspconfig.nvim',

	    -- Useful status updates for LSP
	    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
	    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

	    -- Additional lua configuration, makes nvim stuff amazing!
	    'folke/neodev.nvim',
	},
    },

    {
	-- Autocompletion
	'hrsh7th/nvim-cmp',
	dependencies = {
	    -- Snippet Engine & its associated nvim-cmp source
	    'L3MON4D3/LuaSnip',
	    'saadparwaiz1/cmp_luasnip',

	    -- Adds LSP completion capabilities
	    'hrsh7th/cmp-nvim-lsp',

	    -- Adds a number of user-friendly snippets
	    'rafamadriz/friendly-snippets',
	},
    },


    -- Fuzzy Finder (files, lsp, etc)
    {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependencies = {
	    'nvim-lua/plenary.nvim',
	    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
	    -- Only load if `make` is available. Make sure you have the system
	    -- requirements installed.
	    {
		'nvim-telescope/telescope-fzf-native.nvim',
		-- NOTE: If you are having trouble with this installation,
		--       refer to the README for telescope-fzf-native for more instructions.
		build = 'make',
		cond = function()
		    return vim.fn.executable 'make' == 1
		end,
	    },
	},
    },

    {
	-- Highlight, edit, and navigate code
	-- This is also a dependency of nvim-telescope
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
	    'nvim-treesitter/nvim-treesitter-textobjects',
	},
	build = ':TSUpdate',
    },

    {
	-- Set lualine as statusline
	'nvim-lualine/lualine.nvim',
	-- See `:help lualine.txt`
	opts = {
	    options = {
		icons_enabled = false,
		theme = 'onedark',
		component_separators = '|',
		section_separators = '',
	    },
	},
    },

    -- Convert Markdown to HTML
    -- Two commands NewMarkdownToHTML and MarkdownToHTML
    {
        'realprogrammersusevim/md-to-html.nvim',
        cmd = { 'MarkdownToHTML', 'NewMarkdownToHTML' },
    }

},{})

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false
--
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- set no line wrap by default
vim.opt_local.wrap = false

-- Mouse active
vim.o.mouse = "a"

-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber=true

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Folding options
vim.opt.foldopen = "hor,search"
vim.opt.foldmethod = "indent"
vim.opt.foldcolumn = "2"

-- Add cursorline
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number,screenline"

-- Keep a few lines at the bottom so the cursor never reaches the bottommost line
vim.opt.scrolloff = 5

-- This is supposed to be true for nvim colorschemes and for nvim-tree
vim.o.termguicolors = true

-- Set up a shortcut for pasting to system clipboard
vim.api.nvim_set_keymap("v", "<leader>y", '"*y', { noremap = true })

-- Set up a shortcut for pasting from the yank registry. This works even when something was "d" or "x" before hand
vim.api.nvim_set_keymap("n", "<leader>p", '"0p', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>p", '"0p', { noremap = true })


-- [[ CONFIGURATIONS OF INDIVIDUAL PACKAGES ]]

-- [[ Configure nvim-tree ]]
require("nvim-tree").setup {
    sort = {
	files_first = true
    }
}
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>", { noremap = true })

-- [[ Configure Telescope ]]
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
-- See `:help telescope.builtin` to checkout keymaps
require('telescope').load_extension('fzf')
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- [[ Configure colorscheme ]]
require('onedark').setup {
    style = 'warmer'
}
require('onedark').load()


-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
