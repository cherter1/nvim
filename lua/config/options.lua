local o = vim.opt

-- base --
o.number = true
o.relativenumber = true
o.cursorline = true
o.scrolloff = 10
o.confirm = true
o.wrap = true
o.cmdheight = 1
o.list = true
o.listchars = {
    trail = '·',
    extends = '󰇘',
    precedes = '󰇘',
    nbsp = '␣',
    lead = '·',
    multispace = '·'
}

-- tabs --
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.smartindent = true
o.autoindent = true
o.grepprg = 'rg --vimgrep'
o.grepformat = '%f:%l:%c:%m'

-- search --
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

-- visual --
o.termguicolors = true
o.signcolumn = 'yes'
o.colorcolumn = '120'
o.showmatch = true
o.matchtime = 2
