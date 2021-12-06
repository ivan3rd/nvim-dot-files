if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '>',
  warn_sign = '>',
  hint_sign = '>',
  infor_sign = '>',
  border_style = "round",
}

EOF

nnoremap <silent> tt <Cmd>Lspsaga show_cursor_diagnostics<CR>
nnoremap <silent> tn <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> K <Cmd>Lspsaga hover_doc<CR>
inoremap <silent> <C-,> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> gR <cmd>lua require('lspsaga.rename').rename()<CR>
"nnoremap <silent> <A-t> <cmd>lua require('lspsaga.floaterm').open_float_terminal()<CR>
"tnoremap <silent> <A-t> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>
