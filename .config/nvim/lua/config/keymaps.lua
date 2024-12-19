-- [[ keymaps.lua ]]
local map = vim.api.nvim_set_keymap

-- Toggle nvim-tree filesystem browser
map('n', '<leader>n', ':NvimTreeToggle<CR>', {})
map('n', '<leader>t', ':TagbarToggle<CR>', {})
map('n', '<leader>ff', ':Telescope find_files<CR>', {})

-- File exit alls
map('n', '<leader>x', ':xa<CR>', {})
map('n', '<leader>q', ':qa!<CR>', {})
map('n', '<leader>w', 'wa<CR>', {})
