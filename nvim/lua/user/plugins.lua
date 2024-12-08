local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
    compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'solid' })
        end
    },
})

local use = require('packer').use

-- Packer can manage itself
use('wbthomason/packer.nvim')

use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        vim.cmd('colorscheme rose-pine')

        vim.api.nvim_set_hl(0, 'Normal', {
            bg = 'NONE'
        })

        vim.api.nvim_set_hl(0, 'FloatBorder', {
            fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
            bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
        })

        -- Make the StatusLineNonText background the same as StatusLine
        vim.api.nvim_set_hl(0, 'StatusLineNonText', {
            fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
            bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
        })

        -- Hide the characters in CursorLineBg
        vim.api.nvim_set_hl(0, 'CursorLineBg', {
            fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
            bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
        })
    end
})

use({
  'airblade/vim-rooter',
  setup = function()
    vim.g.rooter_manual_only = 1
  end,
  config = function()
    vim.cmd('Rooter')
  end,
})

-- Commentating Support
use('tpope/vim-commentary')

-- Add, change, delete surrounding text.
use('tpope/vim-surround')

-- Useful commands like :Rename and :SudoWrite
use('tpope/vim-eunuch')

-- Pairs of handy bracking mappings, like [b an ]b
use('tpope/vim-unimpaired')

use('farmergreg/vim-lastplace')
use('nelstrom/vim-visual-star-search')
use('jessarcher/vim-heritage')

-- Select HTML attributes
use({
  'whatyouhide/vim-textobj-xmlattr',
  requires = 'kana/vim-textobj-user',
})

use({
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end,
})

use({
  'karb94/neoscroll.nvim',
  config = function()
    require('user/plugins/neoscroll')
  end,
})

use({
  'AndrewRadev/splitjoin.vim',
  config = function()
    require('user/plugins/splitjoin')
  end,
})

use({
  'sickill/vim-pasta',
  config = function()
    require('user/plugins/pasta')
  end,
})

use({
  'famiu/bufdelete.nvim',
  config = function()
    vim.keymap.set('n', '<Leader>q', ':Bdelete<CR>')
  end,
})

if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins/lua source <afile> 
  augroup end
]])

use({
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    { 'nvim-telescope/telescope-live-grep-args.nvim' },
  },
  config = function()
    require('user/plugins/telescope')
  end,
})

use({
  'nvim-tree/nvim-tree.lua',
  requires = {'nvim-tree/nvim-web-devicons', opt = false},
  config = function()
    require('user/plugins/nvim-tree')
  end,
})

use({
  'nvim-lualine/lualine.nvim',
  requires = {'nvim-tree/nvim-web-devicons', opt = false},
  config = function()
    require('user/plugins/lualine')
  end,
})

use({
  'akinsho/bufferline.nvim',
  requires = {'nvim-tree/nvim-web-devicons', opt = false},
  after = 'rose-pine',
  config = function()
    require('user/plugins/bufferline')
  end,
})

use({
    'lukas-reineke/indent-blankline.nvim',
    config = function ()
        require('user/plugins/indent-blankline')
    end,
})

-- Add a dashboard.
use({
  'nvimdev/dashboard-nvim',
  requires = {'nvim-tree/nvim-web-devicons', opt = false},
  config = function()
    require('user/plugins/dashboard-nvim')
  end
})

-- Git Integration
use({
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup()
        vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
        vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
        vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
        vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
        vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
        vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
    end
})

-- Improved syntax highlighting
use({
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  requires = {
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('user/plugins/treesitter')
  end,
})
