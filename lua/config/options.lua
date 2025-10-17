-- base --
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true
vim.opt.wrap = true
vim.opt.cmdheight = 1
vim.opt.list = true
vim.opt.listchars = {
    trail = '·',
    extends = '󰇘',
    precedes = '󰇘',
    nbsp = '␣',
    lead = '·',
    multispace = '·'
}

-- tabs --
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.grepformat = '%f:%l:%c:%m'

-- search --
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- visual --
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '120'
vim.opt.showmatch = true
vim.opt.matchtime = 2
