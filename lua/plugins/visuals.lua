return {
  {
    'catppuccin/nvim',
    priority = 1000,
    name = 'catppuccin',
    lazy = false,
    init = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
    opts = { auto_integrations = true, flavor = 'macchiato' },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = { theme = 'dracula' }
    },
  }
}
