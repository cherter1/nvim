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
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = { theme = 'dracula' }
        },
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            theme = 'hyper',
            config = {
                header = require('asciiart').LoadAscii()
            }
        }
    }
}
