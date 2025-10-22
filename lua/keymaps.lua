-- command convenience --
vim.keymap.set('i', '<C-c>', '<Esc>', { desc = 'better <C-c>' })

vim.keymap.set('n', '<leader>bn', '<Cmd>bnext<CR>', { desc = 'next buffer' })
vim.keymap.set('n', '<leader>bp', '<Cmd>bprevious<CR>', { desc = 'previous buffer' })

vim.keymap.set('v', '<', '<gv', { desc = 'indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'indent right and reselect' })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- neotree --
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'toggle neotree' })

-- telescope --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- harpoon --
local harpoon = require('harpoon')

vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set('n', '<C-h>', function() harpoon:list():select(1) end)
vim.keymap.set('n', '<C-j>', function() harpoon:list():select(2) end)
vim.keymap.set('n', '<C-k>', function() harpoon:list():select(3) end)
vim.keymap.set('n', '<C-l>', function() harpoon:list():select(4) end)
