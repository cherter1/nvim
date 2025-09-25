-- neotree --
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'toggle neotree' })

-- telescope --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- command convenience --
vim.keymap.set('n', '<leader>bn', '<Cmd>bnext<CR>', { desc = 'next buffer' })
vim.keymap.set('n', '<leader>bp', '<Cmd>bprevious<CR>', { desc = 'previous buffer' })

vim.keymap.set('v', '<', '<gv', { desc = 'indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'indent right and reselect' })
