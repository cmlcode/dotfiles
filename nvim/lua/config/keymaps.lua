-- [[ keymaps.lua ]]
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}

-- Toggle nvim-tree filesystem browser
map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)

-- Terminal mode nav shortcuts
map('t', '<esc>', [[<C-\><C-n>]], opts)
map('t', '<C-W>h', [[<C-\><C-n><C-W>h]], opts)
map('t', '<C-W>j', [[<C-\><C-n><C-W>j]], opts)
map('t', '<C-W>k', [[<C-\><C-n><C-W>k]], opts)
map('t', '<C-W>l', [[<C-\><C-n><C-W>l]], opts)

-- File exit alls
map('n', '<leader>x', ':xa<CR>', opts)
map('n', '<leader>q', ':qa!<CR>', opts)
map('n', '<leader>w', 'wa<CR>', opts)

-- Go back to previous loc
map('n', '<leader>gb', '<C-o>', opts)

