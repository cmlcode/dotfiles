return {
  {
    'Mofiqul/dracula.nvim', -- colorscheme
    lazy = false,
    priority = 1000,
    config = function()
      -- load colorscheme
      vim.cmd([[colorscheme dracula]])
    end,
  },  
  {
    'nvim-lualine/lualine.nvim',  -- statusline
    event = "VimEnter",
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        theme = 'dracula',
      })
    end,
  },
}
