vim.o.cp = false
vim.o.relativenumber = false
vim.o.nu = true
vim.o.relativenumber = true
vim.o.hidden = true
vim.o.errorbells = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.shiftwidth=4
vim.o.expandtab = true
vim.o.colorcolumn = '80'
vim.o.hlsearch = true
vim.o.swapfile = false
vim.o.backup = false

-- undoing files
vim.o.undodir = '/home/ivan/.vim/undodir'
vim.o.undofile = true
vim.o.incsearch = true
vim.o.scrolloff = 8
vim.o.signcolumn = 'yes'
vim.o.laststatus = 2

vim.api.nvim_create_autocmd({'FileType'}, {
  pattern = {'lua', 'html', 'css', 'json', 'javascript', 'typescript', 'vue'},
  callback = function()
    vim.api.nvim_buf_set_option(0, 'tabstop', 2)
    vim.api.nvim_buf_set_option(0, 'shiftwidth', 2)
    vim.api.nvim_buf_set_option(0, 'softtabstop', 2)
  end
})


-- sane text files
vim.o.fileformat='unix'
vim.o.encoding='utf-8'
vim.o.fileencoding='utf-8'

-- code folding, I don't use it very often
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99
vim.o.wrap = false

-- highlight row and column of cursor
vim.o.cursorline = true
vim.o.cursorcolumn = true

-- Mapleader. One key to rule them all
vim.g.mapleader = " "

-- Setting closetag
--let g:closetag_filenames = '*.vue,*.html,*.xhtml,*.phtml'
-- vim.o.closetag_filenames = '*.vue,*.html,*.xhtml,*.phtml'

-- Plug setup
--Plug 'alvan/vim-closetag' "Кандидат на удаление
local Plug = vim.fn['plug#']

vim.call("plug#begin", vim.fn.stdpath("config")..'/plugged')

Plug('gruvbox-community/gruvbox')

Plug('tpope/vim-sensible')
Plug('preservim/nerdcommenter')
Plug('altermo/ultimate-autopair.nvim', { ['branch'] = 'v0.6'})
Plug('AndrewRadev/switch.vim')
Plug('akinsho/toggleterm.nvim')
-- Git
Plug('tpope/vim-fugitive')
Plug('lewis6991/gitsigns.nvim')

Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

-- For vsnip users.
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

Plug('glepnir/lspsaga.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('kyazdani42/nvim-web-devicons')
Plug('kyazdani42/nvim-tree.lua')
Plug('nvim-lua/plenary.nvim')
Plug('BurntSushi/ripgrep')
Plug('hoob3rt/lualine.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('folke/which-key.nvim')
--Plug('unblevable/quick-scope')
Plug('nvimdev/dashboard-nvim')
Plug('Shatur/neovim-session-manager')
Plug('nvim-telescope/telescope-ui-select.nvim')

vim.call('plug#end')

-- Алиас для вызова Git из command mode
vim.cmd('cnoreabbrev git Git')
-- Устанавливаем цветовую схему
vim.cmd('colorscheme gruvbox')
-- syntax highlight
vim.cmd('syntax enable')

vim.api.nvim_set_keymap('i', '<c-k>', '<up>', { noremap=true })
vim.api.nvim_set_keymap('i', '<c-j>', '<down>', { noremap=true })
vim.api.nvim_set_keymap('i', '<c-h>', '<left>', { noremap=true })
vim.api.nvim_set_keymap('i', '<c-l>', '<right>', { noremap=true })

-- Переключение на русскую раскладку
vim.o.keymap = 'russian-jcukenwin'
vim.o.iminsert = 0 -- Чтобы при старте ввод был на английском, а не русском (start > i)
--vim.o.imsearch = 0 -- Чтобы при старте поиск был на английском, а не русском (start > /)

-- Чтобы вместо Ctrl-^ нажимать Alt-a из insert mode и comand mode (включая поиск по файлу)
vim.api.nvim_set_keymap('i', '<A-a>', '<C-^>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('c', '<A-a>', '<C-^>', { noremap=true, silent=true })

-- Shortcuts
-- Session manager
vim.api.nvim_set_keymap('n', '<Leader>S', ':SessionManager save_current_session<CR>', { noremap=true, silent=true })
-- Move to left or right tab by Shift+h/l
vim.api.nvim_set_keymap('n', '<S-l>', ':tabn<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<S-h>', ':tabp<CR>', { noremap=true, silent=true })

-- Open new tab with a current buffer in current line
vim.g.buffer_for_new_tab = 0
vim.g.line_number_for_new_tab = 0
vim.api.nvim_create_autocmd({'TabLeave'}, {
  callback = function()
    vim.g.buffer_for_new_tab = vim.api.nvim_get_current_buf()
    vim.g.line_number_for_new_tab = vim.fn.line(".")
  end
})
vim.api.nvim_create_autocmd({'TabNewEntered'}, {
  callback = function()
    if vim.g.buffer_for_new_tab == vim.api.nvim_get_current_buf() then
      vim.api.nvim_win_set_cursor(0, {vim.g.line_number_for_new_tab, 0})
    end
  end
})
vim.api.nvim_set_keymap('n', '<Leader>t', ':tabnew %:p<CR>', { noremap=true, silent=true })

-- Close buffer
vim.api.nvim_set_keymap('n', '<Leader>c', ':Bclose<CR>', { noremap=true, silent=true })
-- Close windown in tab
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap=true, silent=true })

-- indent/unindent with tab/shift-tab
vim.api.nvim_set_keymap('n', '<Leader><Tab>', '>>' , {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<<', {} )
vim.api.nvim_set_keymap('i', '<S-Tab>', '<Esc><<i', {} )
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', {} )
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', {} )

-- move between windows
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', {} )
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', {} )
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', {} )
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', {} )

-- resize windows
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize +1<CR>', {} )
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize -1<CR>', {} )
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize +1<CR>', {} )
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize -1<CR>', {} )

-- copy to system clipboard
vim.api.nvim_set_keymap('n', '<C-c>', '"+y', {} )
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', {} )


-- saving all files in current session
vim.api.nvim_set_keymap('n', '<Leader>s', ':wa<CR>', {})
-- nmap <Leader>s :wa<CR>

-- toggle comments
vim.api.nvim_set_keymap('', '<Leader>/', '<plug>NERDCommenterInvert', {})

-- Copy full path of file in current buffer
vim.api.nvim_set_keymap('n', ',/', ':let @+ = expand("%:p")<CR>', { noremap = true, silent = true })
-- Copy relative path of file in current buffer
vim.api.nvim_set_keymap('n', ',.', ':let @+ = expand("%")<CR>', { noremap = true, silent = true })
--" Copy only filename
vim.api.nvim_set_keymap('n', ',,', ':let @+ = expand("%:t")<CR>', { noremap = true, silent = true })

-- Turn off highligh of characters selected by *
--nnoremap <silent><Leader>h <Cmd>nohl<CR>
vim.api.nvim_set_keymap('n', '<Leader>h', ':nohl<CR>', { noremap = true, silent = true })

-- restore place in file from previous session
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    if (vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$")) then
      vim.cmd("normal! g'\"")
    end
  end
})

-- Highlight yanked characters
local yank_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = yank_group,
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 500,  -- milliseconds
      on_visual = true,  -- also highlight in visual mode
    })
  end,
})

vim.cmd([[

" Правка для бага питона для отступов.
" Стандратная настройка отступов для Python какая-то странная, поэтому её
" нужно переписать. Подробнее в :h ft-python-indent*
let g:python_indent = {
\  'disable_parentheses_indenting': v:false,
\  'closed_paren_align_last_line': v:false,
\  'searchpair_timeout': 150,
\  'continue': 'shiftwidth()',
\  'open_paren': 'shiftwidth()',
\  'nested_paren': 'shiftwidth()'
\}

"switch.vim
let g:switch_custom_definitions = [
\       switch#NormalizedCase(['from', 'to']),
\       switch#NormalizedCase(['in', 'out'])
\   ]

" fuzzysearch for dashboard
let g:dashboard_default_executive ='telescope'

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Do not remove indent on new empty line (negates work of delimitMate)
""inoremap <CR> <CR>x<BS>

" wrap toggle
setlocal nowrap
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        noremap  <buffer> <silent> <C-k> :wincmd k<CR>
        noremap  <buffer> <silent> <C-j> :wincmd j<CR>
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        noremap  <buffer> <silent> <C-k> gk
        noremap  <buffer> <silent> <C-j> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <C-k>   <C-o>gk
        inoremap <buffer> <silent> <C-j> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
    endif
endfunction
" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
   "Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
       "Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
       "Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
       "Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
]])
