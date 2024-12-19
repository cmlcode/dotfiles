return {
  {
    -- code structure
    'majutsushi/tagbar',
    cmd = 'TagbarToggle',
  },  

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup({})
    end
  }, -- auto close (), {}, [], ...
}
