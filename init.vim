"runtime! plugin/sensible.vim
"set exrc
set norelativenumber
set nu
set relativenumber
set hidden
set noerrorbells
set smartindent
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
if version >= 600
    filetype plugin indent on
endif
let g:closetag_filenames = '*.vue,*.html,*.xhtml,*.phtml'

call plug#begin(stdpath('config') . '/plugged')

"Plug 'itchyny/lightline.vim'
Plug 'gruvbox-community/gruvbox'

Plug 'tpope/vim-sensible'
Plug 'preservim/nerdcommenter'
Plug 'alvan/vim-closetag'
" У плагина выше ^ не работает почему-то автозакрытие тегов. Может быть
" происходит конфликт с YouCompleteMe?
"Plug 'romgrk/barbar.nvim'
Plug 'Raimondi/delimitMate'
Plug 'AndrewRadev/switch.vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'valsorym/.del.vim-tagbar'
"Plug 'jistr/vim-nerdtree-tabs'
Plug 'akinsho/toggleterm.nvim'
"Plug 'lyokha/vim-xkbswitch'
"Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
"Plug 'airblade/vim-gitgutter'
"Plug 'Xuyuanp/nerdtree-git-plugin'

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
Plug 'glepnir/dashboard-nvim'


call plug#end()

colorscheme gruvbox
let mapleader = " "

inoremap <c-k> <up>
inoremap <c-j> <down>
"inoremap <C-H> <Nop>
"inoremap <C-H> <left> так же была забайнджена в after/delimitMate для разрешения кофликта
inoremap <c-l> <right>
vnoremap <c-k> <up>
vnoremap <c-j> <down>
vnoremap <c-h> <left>
vnoremap <c-l> <right>
"nnoremap <Leader>f yiw:Ag <c-r>"<CR>
"nnoremap <Leader>F yiw:Ag <c-r>"<CR>
" Следующие две команды должны скопиравать html тег и вставить его
" закрывающую версию на новой строке
nnoremap <Leader>n <Esc>yi<
nnoremap <Leader>m i</><Esc>lp
nnoremap <Leader>o :pu_<CR>
"n</oright>/ / map <c-/> p b i / <Esc>
" Следующие две команды дают переключение между вкладками vim
"map <F5> :tabp <CR>
"map <F6> :tabn <CR>
"nnoremap <S-l> :bnext<CR>
"nnoremap <Sh> :bprev<CR>
"nnoremap <silent> b< :BufferMovePrevious<CR>
"nnoremap <silent> b> :BufferMoveNext<CR>
"nnoremap <silent> <Leader>bj :BufferPick<CR>
"nnoremap <silent> <Leader>bsn :BufferOrderByBufferNumber<CR>
"nnoremap <silent> <Leader>bsd :BufferOrderByDirectory<CR>
"nnoremap <silent> <Leader>bsl :BufferOrderByLanguage<CR>
"nnoremap <silent> <Leader>bsw :BufferOrderByWindowNumber<CR>
nnoremap <silent> <S-l> :tabn<CR>
nnoremap <silent> <S-h> :tabp<CR>
nnoremap <silent> <Leader>t :tabnew<CR>
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
"nmap <leader><Up> :wincmd k<CR>
"nmap <leader><Down> :wincmd j<CR>
"nmap <leader><Left> :wincmd h<CR>
"nmap <leader><Right> :wincmd l<CR>

" Copy to system clipboard
nmap <C-c> "*y
vmap <C-c> "*y

" QuickScope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" Следующие строки ребайндяд комбинации клавиш установленные плагинами
map <Leader>/ <plug>NERDCommenterInvert
"nmap <Leader>t :TagbarToggle<CR>
"nmap <Leader>b :Buffers<CR>

let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
au FileType vue let b:delimitMate_matchpairs = "(:),{:},[:]"

" XkbSwitch
"let g:XkbSwitchEnabled = 1
"let g:XkbSwitchLib = '/usr/local/lib/libxkbswitch.dylib'
"let g:XkbSwitchIMappings = ['ru']
"let g:XkbSwitchNLayout = 'us'
"set keymap=russian-jcukenwin

"switch.vim
let g:switch_custom_definitions = [
\       switch#NormalizedCase(['from', 'to']),
\       switch#NormalizedCase(['in', 'out'])
\   ]



" ale
"map <leader>e <Plug>(ale_next_wrap)
"map <leader>r <Plug>(ale_previous_wrap)
"let g:ale_linters = {'python': ['flake8']}
"let g:ale_fixers = {
"\    'python': ['black']
"\   }

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

" Вставляем пустые строки в нормальном режиме
" options for builtin saving sessions
set ssop-=options " do not store global and local values in a session
set ssop-=folds " do not store folds

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" WHITESPACES and how to deal with them
" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.

"nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><S-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
"nnoremap <silent><S-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" highlight yanked text
augroup yank_highlight
  autocmd!
  if exists('##TextYankPost')
      autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank { timeout = 750 }
  endif
augroup END

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
":inoremap <CR> <CR>x<BS>

" wrap toggle
setlocal nowrap
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
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
 "close buffers
"nnoremap <silent> <Leader>c :Bclose<CR>
"nnoremap <silent> <Leader>q :q<CR>


" next function is needed to remove some of keybindings
" guess it must work in lua
"function delete_key_bindings:
    "for (key in editor.keyBinding.$defaultHandler.commandKeyBinding) {
    "if (key !== "ctrl-d" && key !== "command-d")
        "delete editor.keyBinding.$defaultHandler.commandKeyBinding[key]
"}
