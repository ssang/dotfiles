require('dashboard').setup({
  theme = 'hyper',
  config = {
    header = {
        '',
        '',
        ' ▄▄▄▄▄▄   ▄▄▄▄▄▄▄ ▄▄▄     ',
        '█   ▄  █ █       █   █    ',
        '█  █ █ █ █  ▄▄▄▄▄█   █    ',
        '█   █▄▄█▄█ █▄▄▄▄▄█   █    ',
        '█    ▄▄  █▄▄▄▄▄  █   █▄▄▄ ',
        '█   █  █ █▄▄▄▄▄█ █       █',
        '█▄▄▄█  █▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█',
        '',
        '',
    },
    week_header = {
        enable = true,
    },
    shortcut = {
      { icon = ' ', group = '@property', key = 'n', desc = 'New file', action = 'enew' },
      { icon = ' ', group = 'DashboardProjectTitle', key = 'f', desc = 'Find file', action = 'Telescope find_files' },
      { icon = ' ', group = 'DiagnosticHint', key = 'h', desc = 'Recent files', action = 'Telescope oldfiles' },
      { icon = '󰩉 ', group = 'Number', key = 'g', desc = 'Find Word', action = 'Telescope live_grep' },
    },
    project = {
        enable = true,
        limit = 8,
        icon =  '󰿘 ',
    },
    footer = {}
  }
})

vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#6272a4' })
vim.api.nvim_set_hl(0, 'DashboardCenter', { fg = '#f8f8f2' })
vim.api.nvim_set_hl(0, 'DashboardShortcut', { fg = '#bd93f9' })
vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#6272a4' })
