return {
  {
    'williamboman/mason.nvim',
    cmd = { "Mason", "MasonUpdate" },
    config = function()
      require("mason").setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    event = "BufReadPre",
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "pyright" },
        automatic_installation = true,
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    ft = { "python", "c", "cpp" },
    keys = { "gd", "K" },
    config = function()
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')

      mason_lspconfig.setup_handlers({
        -- Generic LSP setup
        function(server_name)
          lspconfig[server_name].setup {
            on_attach = function(client, bufnr)
              local bufopts = { noremap = true, silent=true, buffer=bufnr }
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
              vim.keymap.set('n',  'K', vim.lsp.buf.hover, bufopts)
              vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
            end
          }
        end,

        -- Settings for each lsp
        ["clangd"] = function()
          lspconfig.clangd.setup {
            on_attach = function(client, bufnr)
              local bufopts = { noremap = true, silent=true, buffer=bufnr }
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
              vim.keymap.set('n',  'K', vim.lsp.buf.hover, bufopts)
              vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
            end,
            filetypes = { "c", "cpp", "objc", "objcpp" }
          }
        end,
        ['pyright'] = function()
          lspconfig.pyright.setup{
            on_attach = function(client, bufnr)
              local bufopts = { noremap = true, silent=true, buffer=bufnr }
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
              vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
              vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
            end,
          }
        end,
        ['rust-analyzer'] = function()
          lspconfig.rust_analyzer.setup{
            on_attach = function(client, bufnr)
              local bufopts = { noremap = true, silent=true, buffer=bufnr }
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
              vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
              vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
            end,
          }
        end,
      })
    end
  }
}
