return {
    'mason-org/mason.nvim',
    opts = {
        registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry",
        },
        ensure_installed = {
            "csharpier",
            "eslint_d",
            "lua-language-server",
            "prettierd",
            "stylua",
            "vue-language-server",
            "roslyn",
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
