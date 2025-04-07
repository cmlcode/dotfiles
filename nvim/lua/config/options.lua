--[[ options.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- [[ Context ]]
opt.colorcolumn = '80'		-- str : Show col for max line length
opt.number = true	      	-- bool: Show line numbers
opt.relativenumber = true	-- bool: Show relative line numbers
opt.scrolloff = 4		      -- int : Min num lines of context
opt.signcolumn = "yes"		-- str : Show the sign column

-- [[ Filetypes ]]
opt.encoding = 'utf8'		  -- str : String encoding to use
opt.fileencoding = 'utf8'	-- str : File encoding to use

-- [[ Theme ]]
opt.syntax = "ON"		      -- str : Allow syntax highlighting
opt.termguicolors = true	-- bool: If terminal supports ui color, enable

-- [[ Search ]]
opt.ignorecase = true		  -- bool: Ignore case in search patterns
opt.smartcase = true		  -- bool: override ignorecase if search has caps
opt.incsearch = true		  -- bool: Use incremental search
opt.hlsearch = true		    -- bool: Highlight search matches

-- [[ Whitespace ]]
opt.expandtab = false 
opt.shiftwidth = 2        -- num : Size of an indent
opt.softtabstop = 2       -- num : num of spaces for insert mode
opt.tabstop = 2           -- num : num of spaces tab counts for

-- [[ Splits ]]
opt.splitright = true     -- bool: Place new window to right of curr
opt.splitbelow = true     -- bool: Place new window below curr

-- [[ Clipboard ]]
opt.clipboard = "unnamedplus"
