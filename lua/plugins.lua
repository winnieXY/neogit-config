local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Shorthand notation for GitHub; translates to https://github.com/junegunn/vim-easy-align
Plug('junegunn/vim-easy-align')

-- Any valid git URL is allowed
Plug('https://github.com/junegunn/seoul256.vim.git')

-- Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug('fatih/vim-go', { ['tag'] = '*' })

-- Using a non-default branch
Plug('neoclide/coc.nvim', { ['branch'] = 'release' })

-- Use 'dir' option to install plugin in a non-default directory
--Plug('junegunn/fzf', { ['dir'] = '~/.fzf' })

-- Post-update hook: run a shell command after installing or updating the plugin
--Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })

-- Post-update hook can be a lambda expression
--Plug('junegunn/fzf', { ['do'] = function()
--  vim.fn['fzf#install']()
--end })


Plug('nvim-lua/plenary.nvim')

Plug('sindrets/diffview.nvim')

--Plug('ibhagwan/fzf-lua')
Plug('nvim-telescope/telescope.nvim')

Plug('NeogitOrg/neogit') 

Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')


Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

--Plug('zbirenbaum/copilot.lua')

Plug('lewis6991/gitsigns.nvim')

-- If the vim plugin is in a subdirectory, use 'rtp' option to specify its path
Plug('nsf/gocode', { ['rtp'] = 'vim' })

-- On-demand loading: loaded when the specified command is executed
Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })

-- On-demand loading: loaded when a file with a specific file type is opened
Plug('tpope/vim-fireplace', { ['for'] = 'clojure' })

-- Plug('ldelossa/nvim-ide')

Plug('dnlhc/glance.nvim')
vim.call('plug#end')

require('telescope')
require('nvim-cmp')
-- require('nvim-ide')
require('glance-conf')

local  neogit = require('neogit')
neogit.setup {}

require('gitsigns-conf')