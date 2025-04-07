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
				ensure_installed = { "clangd", "pyright", "rust_analyzer" },
				automatic_installation = true,
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		ft = { "python", "c", "cpp", "rust" },
		keys = { "gd", "K" },
		config = function()
			local lspconfig = require('lspconfig')
			local mason_lspconfig = require('mason-lspconfig')
			
			local function on_attach(client, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr}
				vim.keymap.set('n',  '<leader>K', vim.lsp.buf.hover, bufopts)
				vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, bufopts)
				vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
			end

			mason_lspconfig.setup_handlers({
				-- Settings for each lsp
				["clangd"] = function()
					lspconfig.clangd.setup {
						on_attach = on_attach,
						filetypes = { "c", "cpp", "objc", "objcpp" }
					}
				end,
				['pyright'] = function()
					lspconfig.pyright.setup{
						on_attach = on_attach 
					}
				end,
				['rust_analyzer'] = function()
					lspconfig.rust_analyzer.setup{
						on_attach = on_attach,
						settings = {
							["rust_analyzer"] = {
								rustfmt = {
									extraArgs = {"--config-path", "/home/cml/Documents/Coding/.rustfmt.toml"} ,
								}
							}
						}
					}
				end,
				-- Generic LSP setup
			})
		end
	}
}
