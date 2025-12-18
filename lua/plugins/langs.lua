return {
    {
        "cseickel/diagnostic-window.nvim",
        dependencies = { "MunifTanjim/nui.nvim" }
    },
    { "neovim/nvim-lspconfig", lazy = false },
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
        "numToStr/Comment.nvim",
        lazy = false,
        opts = {
            toggler = {
                line = "gcc",
                block = "gbc",
            },
        },
    },
    {
        'stevearc/conform.nvim',
        opts = {
            async = true,
            formatters_by_ft = {
                cs = { "csharp_conf" },
                csproj = { "csharp_conf" }
            },
            formatters = {
                csharp_conf = {
                    command = "csharpier",
                    args = {
                        "format",
                    },
                },
            },
        }
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    -- CSHARP LANG SERVER --
    {
        "seblyng/roslyn.nvim",
        opts = { filewatching = 'off' }
    }
}
