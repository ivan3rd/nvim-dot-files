
lua << EOF
local home = os.getenv('HOME')
local db = require('dashboard')
db.setup({
    theme = 'doom',
    disable_move = true,
    config = {
      --  header = {} -- если мне захочется новый заголовок
       week_header = {
        enable = true,
       },
        center = {
         { desc = ' Latest Session', group = 'Number', action = ':SessionManager load_current_dir_session', key = 'S' },
         { desc = '󰊳 Update', group = '@property', action = 'PlugUpdate', key = 'u' },
         {
           icon = ' ',
           icon_hl = '@variable',
           desc = 'Files',
           group = 'Label',
           action = 'Telescope find_files',
           key = 'f',
         },
        },
    },
})

EOF
