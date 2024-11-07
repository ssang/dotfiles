neoscroll = require('neoscroll')
neoscroll.setup()

local keymap = {
  ['<C-u>'] = function() neoscroll.scroll('-vim.wo.scroll', { move_cursor=true; duration=50 }) end;
  ['<C-d>'] = function() neoscroll.scroll('vim.wo.scroll', { move_cursor=true; duration=50 }) end;
}

local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end
