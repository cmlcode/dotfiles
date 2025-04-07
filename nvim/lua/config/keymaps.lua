-- [[ keymaps.lua ]]
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}

-- Toggle nvim-tree filesystem browser
map('n', '<leader>n', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>t', ':TagbarToggle<CR>', opts)
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)

-- File exit alls
map('n', '<leader>x', ':xa<CR>', opts)
map('n', '<leader>q', ':qa!<CR>', opts)
map('n', '<leader>w', 'wa<CR>', opts)

-- Go back to previous loc
map('n', '<leader>gb', '<C-o>', opts)
