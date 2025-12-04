vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require('config.lazy')
require('config.options')
require('keymaps')

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

vim.lsp.config('roslyn', {
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
            dotnet_analyzer_diagnostics_scope = 'fullSolution',
            dotnet_compiler_diagnostics_scope = 'fullSolution',
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

local function lighten(hex, percent)
    local r = tonumber(hex:sub(2,3),16)
    local g = tonumber(hex:sub(4,5),16)
    local b = tonumber(hex:sub(6,7),16)
    r = math.floor(r + (255 - r) * (0.01 * percent))
    g = math.floor(g + (255 - g) * (0.01 * percent))
    b = math.floor(b + (255 - b) * (0.01 * percent))
    return string.format('#%02x%02x%02x', r, g, b)
end


vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('mattGuyGroup', {}),
    callback = function(e)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = e.buf, desc = 'Go to definition' })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = e.buf, desc = 'Go to implementation' })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = e.buf, desc = 'Get references' })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = e.buf, desc = 'hover diagnostic info' })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = e.buf, desc = 'rename symbol' })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = e.buf, desc = 'open code actions window' })

        vim.api.nvim_set_hl(0, "@lsp.type.struct.cs", { link = "TypeStruct" })
        vim.api.nvim_set_hl(0, "@lsp.type.enum.cs", { link = "TypeStruct" })
        vim.api.nvim_set_hl(0, "@lsp.type.interface.cs", { link = "TypeStruct" })
        vim.api.nvim_set_hl(0, "TypeStruct", { fg = lighten('#eed49f', 50), bold = true })

    end,
})

local signs = {
    ERROR = ' ',
    WARN = ' ',
    INFO = ' ',
    HINT = '󰌵 ',
}

vim.diagnostic.config({
    float = {
        source = 'if_many',
        severity_sort = true,
    },
    virtual_text = {
        source = 'if_many',
        prefix = function(diagnostic)
            return signs[vim.diagnostic.severity[diagnostic.severity]]
        end,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs['ERROR'],
            [vim.diagnostic.severity.WARN] = signs['WARN'],
            [vim.diagnostic.severity.INFO] = signs['INFO'],
            [vim.diagnostic.severity.HINT] = signs['HINT'],
        },
        linehl = { [vim.diagnostic.severity.INFO] = 'DiagnosticInfoMsg' },
        numhl = { [vim.diagnostic.severity.WARN] = 'WarningMsg' },
    },
})

vim.cmd('packadd! nohlsearch')

vim.lsp.enable({
    "lua_ls",
    "roslyn"
})
