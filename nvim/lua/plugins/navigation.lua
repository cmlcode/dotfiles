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
          file_ignore_patterns = { ".git/" },
        },
      })
    end,
    cmd = "Telescope",
  },

  -- [[ Terminal Toggle ]]
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 12,
				open_mapping = nil,
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
      })
			local Terminal = require("toggleterm.terminal").Terminal
			vim.keymap.set({ "n", "t" }, "<leader>t", function()
				vim.cmd("ToggleTerm direction=horizontal")
			end, { desc = "Toggle Terminal" })

    end,
    cmd = { "ToggleTerm" },  -- lazy load on these commands
    keys = {
      { "<leader>t", desc = "Toggle Terminal" },
    },
  },
}

