return {
  { 
    'kyazdani42/nvim-tree.lua', -- filesystem navigation
    dependencies = { 'kyazdani42/nvim-web-devicons' },  -- filesystem icons
    config = function()
      require 'nvim-web-devicons'.setup { default = true }

      require('nvim-tree').setup({
        update_cwd = true,
      })
    end,
    cmd = { "NvimTreeToggle" },
  },
  -- [[ Dev ]]
  {
    'nvim-telescope/telescope.nvim',  -- fuzzyfinder
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        defaults = {
          file_ignore_matters = { ".git/" },
        },
      })
    end,
    cmd = "Telescope",
  },
}
