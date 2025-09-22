vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

local o = vim.opt
o.number = true
o.relativenumber = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.termguicolors = true
o.list = true
o.ignorecase = true
o.smartcase = true
o.cursorline = true
o.scrolloff = 10
o.confirm = true

vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.fn.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }))
end, { desc = 'Print the git blame for the current line' })

vim.cmd('packadd! nohlsearch')

-- lazy vim plugin manager
local nvimDataPath = vim.fn.stdpath("data")
local lazypath = nvimDataPath .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({ "git", "clone", "--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git", lazypath, "--branch=stable"})
end
vim.opt.rtp:prepend(lazypath)

local TREESITTER_PATH = nvimDataPath .. "\\nvim-data\\treesitter"

--PLUGINS
require("lazy").setup({
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function(_, opts)
      vim.opt.runtimepath:append(TREESITTER_PATH)
      require("nvim-treesitter.configs").setup(opts)
    end,
    opts = {
      enusre_installed = { "lua" },
      parser_install_dir = TREESITTER_PATH,
      highlight = { enable = true, },
      indent = { enable = true, },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    },
  },
  { "neovim/nvim-lspconfig", lazy = false },
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    lazy = false,
    init = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
    opts = { auto_integrations = true, flavour = "mocha" },
  },
  {
    "saghen/blink.cmp",
    lazy = false,
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
      keymap = { preset = "default" },
      appearance = { nerd_font_variant = "mono" },
      completion = { documentation = { auto_show = false } },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      fuzzy = { implementation = "lua" },
    },
    opts_extend = { "sources.default" },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require('lualine').setup({
        options = { theme = 'dracula' }
      })
    end
  }
})

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'open neotree' })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.lsp.enable({
  "lua_ls"
})
