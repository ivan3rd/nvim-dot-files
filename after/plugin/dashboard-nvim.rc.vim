
lua << EOF
local home = os.getenv('HOME')
local db = require('dashboard')
db.setup({
    theme = 'hyper',
    disable_move = true,
    config = {
      week_header = {
       enable = true,
      },
      shortcut = {
        { desc = ' Latest Session', group = 'Number', action = ':source ../Session.vim', key = 's' },
        { desc = '󰊳 Update', group = '@property', action = 'PlugUpdate', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        -- {
        --   desc = ' Apps',
        --   group = 'DiagnosticHint',
        --   action = 'Telescope app',
        --   key = 'a',
        -- },
        -- {
        --   desc = ' dotfiles',
        --   group = 'Number',
        --   action = 'Telescope dotfiles',
        --   key = 'd',
        -- },
      },
    },
})
EOF
