lua << EOF
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '3', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'horizontal', -- | 'vertical' | 'window' | 'float'
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    go_back = 0, --By default focus is returned to the original window after executing the command. Set to zero to disable this behavior
    width = 100,
    height = 30,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
--
---- if you only want these mappings for toggle term use term://*toggleterm#* instead
--vim.cmd('autocmd! ToggleTerm term://* lua set_terminal_keymaps()')

EOF
"if !exists('g:togglterm')
  "finish
"endif
"let g:toggleterm_terminal_mapping = '<C-t>'
" or manually...
"autocmd TermEnter term://*toggleterm#*
      "\ tnoremap <silent><C-t> <Cmd>exe "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><leader>th <Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>
"inoremap <silent><leader>th <Esc><Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>
nnoremap <silent><leader>tv <Cmd>exe v:count1 . "ToggleTerm direction=vertical"<CR>
"inoremap <silent><leader>tv <Esc><Cmd>exe v:count1 . "ToggleTerm direction=vertical"<CR>
nnoremap <silent><leader>tf <Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>
"inoremap <silent><leader>tf <Esc><Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>
nnoremap <silent><leader>tt <Cmd>exe v:count1 . "ToggleTerm direction=tab"<CR>
"inoremap <silent><leader>tt <Esc><Cmd>exe v:count1 . "ToggleTerm direction=tab"<CR>
" terminal mode navigation
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-W>h
tnoremap <C-j> <C-\><C-n><C-W>j
tnoremap <C-k> <C-\><C-n><C-W>k
tnoremap <C-l> <C-\><C-n><C-W>l

