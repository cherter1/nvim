local TREESITTER_PATH = vim.fn.stdpath('data') .. '/treesitter'

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function(_, opts)
    vim.opt.runtimepath:prepend(TREESITTER_PATH)
    require('nvim-treesitter.configs').setup(opts)
  end,
  opts = {
    enusre_installed = { 'lua' },
    auto_install = false,
    parser_install_dir = TREESITTER_PATH,
    highlight = { enable = true, },
    indent = { enable = true, },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gnn', -- set to `false` to disable one of the mappings
        node_incremental = 'grn',
        scope_incremental = 'grc',
        node_decremental = 'grm',
      },
    },
  },
}
