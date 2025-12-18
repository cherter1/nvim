local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", lazypath, "--branch=stable"})
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require('lazy').setup('plugins', opts)
