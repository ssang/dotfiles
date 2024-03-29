vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
vim.keymap.set('v', 'y', 'myy`y')

-- Disable annoying command line type
vim.keymap.set('n', 'q:', ':q')

-- Paste replace visual selection without copying it
vim.keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode
vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
vim.keymap.set('i', ',,', '<Esc>A,<Esc>')

vim.keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- Open the current file in the default program
vim.keymap.set('n', '<Leader>x', ':!xdg-open %<CR><CR>')

-- Move lines up and down
vim.keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
vim.keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
vim.keymap.set('n', '<A-j>', ':move .+1<CR>==')
vim.keymap.set('n', '<A-k>', ':move .-2<CR>==')
vim.keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
vim.keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")
-- vim.keymap.set('x', '<A-j>', ":move '>+1<CR>gv-gv")
-- vim.keymap.set('x', '<A-k>', ":move '<-2<CR>gv-gv")

vim.keymap.set({'n', 'v', 'i'}, '<ScrollWheelUp>', '<C-Y>')
vim.keymap.set({'n', 'v', 'i'}, '<ScrollWheelDown>', '<C-E>')
