local actions = require('telescope.actions')
vim.api.nvim_set_keymap('n', '\\f', ':Telescope find_files<CR>', {noremap = true, silent = true} )
vim.api.nvim_set_keymap('n', '\\r', ':Telescope live_grep<CR>', {noremap = true, silent = true} )
vim.api.nvim_set_keymap('n', '\\\\', ':Telescope find_files<CR>', {noremap = true, silent = true} )
vim.api.nvim_set_keymap('n', '\\h', ':Telescope help_tags<CR>', {noremap = true, silent = true} )

-- Global remapping
------------------------------

require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}

