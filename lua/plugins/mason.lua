return {
    'mason-org/mason.nvim',
    opts = {
        ensure_installed = {
            "csharpier",
            "eslint_d",
            "lua-language-server",
            "prettierd",
            "stylua",
            "vue-language-server",
        },
        ui = {
            icons = {
                package_installed = '✓',
                package_pending = '➜',
                package_uninstalled = '✗'
            }
        }
    }
}
