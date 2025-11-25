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

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('mattGuyGroup', {}),
    callback = function(e)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = e.buf, desc = 'Go to definition' })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = e.buf, desc = 'Go to implementation' })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = e.buf, desc = 'Get references' })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = e.buf, desc = 'hover diagnostic info' })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = e.buf, desc = 'rename symbol' })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = e.buf, desc = 'open code actions window' })
    end,
})

vim.cmd('packadd! nohlsearch')

vim.lsp.enable({
  "lua_ls",
  "roslyn"
})
