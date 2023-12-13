"runtime! plugin/sensible.vim
"set exrc
set norelativenumber
set nu
set relativenumber
set hidden
set noerrorbells
"set smartindent
set ignorecase
set smartcase
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=80
"set viminfo='25,\"50,n~/.viminfo
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType vue setlocal tabstop=2 shiftwidth=2 softtabstop=2
set hlsearch
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set laststatus=2
" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
" code folding
set foldmethod=indent
set foldlevel=99
set nowrap
" highlight row and column of cursor
set cursorline
set cursorcolumn

syntax on

set nocp
let g:closetag_filenames = '*.vue,*.html,*.xhtml,*.phtml'

call plug#begin(stdpath('config') . '/plugged')

Plug 'gruvbox-community/gruvbox'

Plug 'tpope/vim-sensible'
Plug 'preservim/nerdcommenter'
Plug 'alvan/vim-closetag' "Кондидат на удаление
Plug 'altermo/ultimate-autopair.nvim', { 'branch': 'v0.6', 'event': [ 'InsertEnter', 'CmdlineEnter' ]}
Plug 'AndrewRadev/switch.vim'
Plug 'akinsho/toggleterm.nvim'
"Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/which-key.nvim'
Plug 'unblevable/quick-scope'
Plug 'nvimdev/dashboard-nvim'
Plug 'Shatur/neovim-session-manager'
Plug 'nvim-telescope/telescope-ui-select.nvim'

Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' } "Дебагер но для GNU?

Plug 'mfussenegger/nvim-dap' "Debuger and breakpoints
Plug 'rcarriga/nvim-dap-ui' "UI for said debuger
Plug 'ofirgall/goto-breakpoints.nvim' " Move to breakpoints in code

call plug#end()

colorscheme gruvbox
let mapleader = " "

inoremap <c-k> <up>
inoremap <c-j> <down>
vnoremap <c-k> <up>
vnoremap <c-j> <down>
vnoremap <c-h> <left>
vnoremap <c-l> <right>
nnoremap <Leader>o :pu_<CR>

" Переключение на русский
set keymap=russian-jcukenwin
set iminsert=0 " Чтобы при старте ввод был на английском, а не русском (start > i)
set imsearch=0 " Чтобы при старте поиск был на английском, а не русском (start > /)
" Дополнительно можно добавить:
inoremap <silent><A-a> <C-^>
" Чтобы вместо Ctrl-^ нажимать Alt-a
highlight lCursor guifg=Cyan guibg=Cyan "Смена цвета курсора

nnoremap <silent> <Leader>S :SessionManager save_current_session<CR>
nnoremap <silent> <S-l> :tabn<CR>
nnoremap <silent> <S-h> :tabp<CR>
nnoremap <silent> <Leader>t :tabnew %:p<CR> | g'"
" Buffer close
nnoremap <silent> <Leader>c :Bclose<CR>
nnoremap <silent> <Leader>q :q<CR>
" closing  windows
nmap za :w \| source ~/.config/nvim/init.vim<CR>

" indent/unindent with tab/shift-tab
nmap <Leader><Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv
" move through split windows
nmap <C-h> :wincmd h<CR>
nmap <C-k> :wincmd k<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-l> :wincmd l<CR>
" resize windows
nmap <C-Up> :resize +1<CR>
nmap <C-Down> :resize -1<CR>
nmap <C-Left> :vertical resize +1<CR>
nmap <C-Right> :vertical resize -1<CR>

" Copy to system clipboard
nmap <C-c> "+y
vmap <C-c> "+y

" QuickScope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

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


" Следующие строки ребайндяд комбинации клавиш установленные плагинами
map <Leader>/ <plug>NERDCommenterInvert

"switch.vim
let g:switch_custom_definitions = [
\       switch#NormalizedCase(['from', 'to']),
\       switch#NormalizedCase(['in', 'out'])
\   ]

" fuzzysearch for dashboard
let g:dashboard_default_executive ='telescope'

" saving files
nmap <Leader>s :wa<CR>

" Utils commands for working with data
" Copy full path of file in current buffer
nnoremap <silent>,/ :let @+ = expand("%:p")<CR>
" Copy relative path of file in current buffer
nnoremap <silent>,. :let @+ = expand("%")<CR>
" Copy only filename
nnoremap <silent>,, :let @+ = expand("%:t")<CR>

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" highlight yanked text
augroup yank_highlight
  autocmd!
  if exists('##TextYankPost')
      autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank { timeout = 750 }
  endif
augroup END
autocmd ColorScheme * highlight TextYankPost guifg='#42aaff' gui=underline ctermfg=155 cterm=underline

" Выключаем подсветку выбранного с помощью * слова
nnoremap <silent><Leader>h <Cmd>nohl<CR>


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
inoremap <CR> <CR>x<BS>

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
