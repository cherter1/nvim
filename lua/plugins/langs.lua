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
                -- line comment
                line = "gcc",
                -- block comment
                block = "gbc",
            },
        },
    },
    -- CSHARP LANG SERVER --
    {
        "seblyng/roslyn.nvim",
        dependencies = { 'tris203/rzls.nvim' },
        config = function(_, opts)
            require('roslyn').setup(opts)

            vim.lsp.config('roslyn', {
                on_attach = function()
                    print('testing')
                end,
                handlers = require('rzls.roslyn_handlers'),
                settings = {
                    ['csharp|inlay_hints'] = {
                        csharp_enable_inlay_hints_for_implicit_variable_types = true,
                        csharp_enable_inlay_hints_for_implicit_object_creation = true,
                        csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                        dotnet_enable_inlay_hints_for_parameters = true,
                        dotnet_enable_inlay_hints_for_literal_parameters = true,
                        dotnet_enable_inlay_hints_for_indexer_parameters = true,
                        dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                        dotnet_enable_inlay_hints_for_other_parameters = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                        dotnet_enable_inlay_hints_for_types = true,
                    },
                    ['csharp|background_analysis'] = {
                        dotnet_analyzer_diagnostics_scope = 'openFiles',
                        dotnet_compiler_diagnostics_scope = 'openFiles',
                    },
                    ['csharp|completion'] = {
                        dotnet_show_name_completion_suggestions = true,
                        dotnet_provide_regex_completions = true,
                        dotnet_show_completion_items_from_unimported_namespaces = true,
                    },
                    ['csharp|symbol_search'] = {
                        dotnet_search_reference_assemblies = true,
                    },
                    ['csharp|formatting'] = {
                        dotnet_organize_imports_on_format = true,
                    },
                    ['csharp|code_lens'] = {
                        dotnet_enable_references_code_lens = true,
                        dotnet_enable_tests_code_lens = true,
                    },
                    ['navigation'] = {
                        dotnet_navigate_to_decompiled_sources = true,
                    }
                },
            })
        end,
        opts = {
            filewatching = 'roslyn',
        }
    }
}
