let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width_in_columns = 20 "30 by default, can be width_in_columns or 'width_in_percent%'
"let g:nvim_tree_ignore = [] "[ '.git', 'node_modules', '.cache' ] empty by default
"let g:nvim_tree_gitignore = 0 "0 by default
"let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
"let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
"let g:nvim_tree_hide_dotfiles = 0 "0 by default, this option hides files and folders starting with a dot `.`
"let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
"let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
"let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
"let g:nvim_tree_auto_resize = 1 "1 by default, will resize the tree to its saved width when opening a file
"let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
"let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
"let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
"let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
"let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
"let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
"let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
"let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
"let g:nvim_tree_window_picker_exclude = {
    "\   'filetype': [
    "\     'notify',
    "\     'packer',
    "\     'qf'
    "\   ],
    "\   'buftype': [
    "\     'terminal'
    "\   ]
    "\ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
"let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
"let g:nvim_tree_show_icons = {
"    \ 'git': 1,
"    \ 'folders': 1,
"    \ 'files': 1,
"    \ 'folder_arrows': 1,
"    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
"let g:nvim_tree_icons = {
    "\ 'default': '',
    "\ 'symlink': '',
    "\ 'git': {
    "\   'unstaged': "✗",
    "\   'staged': "✓",
    "\   'unmerged': "",
    "\   'renamed': "➜",
    "\   'untracked': "★",
    "\   'deleted': "",
    "\   'ignored': "◌"
    "\   },
    "\ 'folder': {
    "\   'arrow_open': "",
    "\   'arrow_closed': "",
    "\   'default': "",
    "\   'open': "",
    "\   'empty': "",
    "\   'empty_open': "",
    "\   'symlink': "",
    "\   'symlink_open': "",
    "\   },
    "\   'lsp': {
    "\     'hint': "",
    "\     'info': "",
    "\     'warning': "",
    "\     'error': "",
    "\   }
    "\ }

nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose and NvimTreeFocus are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

lua << EOF
-- following options are the default
require'nvim-tree'.setup {
  -- disables netrw completely
  disable_netrw       = true,
  -- quit_on_open        = true,
  -- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup  = {},
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  -- auto_close          = true,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = true,
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  -- update_cwd          = false,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  respect_buf_cwd = true,

  renderer = {
    highlight_git = true,
    highlight_opened_files = "name",
    root_folder_modifier = ':~',
    add_trailing = true,
    group_empty = true,
    special_files = { 'README.md', 'Makefile', 'MAKEFILE' },
    icons = {
        symlink_arrow = ' >> ',
        padding = ' ',
        show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
        },
        glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },

    }
  },

  update_focused_file = {
    -- enables the feature
    enable      = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd  = nil,
    -- the command arguments as a list
    args = {}
  },
  view = {
      width = 25,
      side = 'left',
  },
  git = {
      enable = true,
      ignore = false,
      timeout = 500,
  }
}
EOF

" Select action
"let s:select_wins_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

"function! s:restore_statuslines(store) abort
  "for winnr in keys(a:store)
    "call setwinvar(winnr, '&statusline', a:store[winnr])
  "endfor
"endfunction

"function s:store_statusline(store, winnr) abort
  "let a:store[a:winnr] = getwinvar(a:winnr, '&statusline')
"endfunction

 "returns
   "-1  - User cancelled
   "0   - No window selected
   "> 0 - Selected winnr
"function! select_wins#start(buftypes, filetypes, floating_windows) abort
  "let store = {}
  "let char_idx_mapto_winnr = {}
  "let char_idx = 0
  "for winnr in range(1, winnr('$'))
    "let bufnr = winbufnr(winnr)
    "if index(a:buftypes, getbufvar(bufnr, '&buftype')) >= 0
      "continue
    "endif
    "let filetype = getbufvar(bufnr, '&filetype')
    "if index(g:coc_explorer_filetypes, filetype) >= 0
      "continue
    "endif
    "if index(a:filetypes, filetype) >= 0
      "continue
    "endif
    "if a:floating_windows && coc_explorer#util#is_float(winnr)
      "continue
    "endif
    "call s:store_statusline(store, winnr)
    "let char_idx_mapto_winnr[char_idx] = winnr
    "let char = s:select_wins_chars[char_idx]
    "let statusline = printf('%%#CocExplorerSelectUI#%s %s', repeat(' ', winwidth(winnr)/2-1), char)
    "call setwinvar(winnr, '&statusline', statusline)
    "let char_idx += 1
  "endfor

  "if len(char_idx_mapto_winnr) == 0
    "call s:restore_statuslines(store)
    "return 0
  "elseif len(char_idx_mapto_winnr) == 1
    "call s:restore_statuslines(store)
    "return char_idx_mapto_winnr[0]
  "else
    "redraw!
    "let select_winnr = -1
    "while 1
      "echo 'Please press the letter on statusline to select window, or press <ESC> to cancel'
      "let nr = getchar()
      "if nr == 27 " ESC
        "break
      "else
        "let select_winnr = get(char_idx_mapto_winnr, string(nr - char2nr('a')), -1)
        "if select_winnr != -1
          "break
        "endif
      "endif
    "endwhile
    "call s:restore_statuslines(store)
    "return select_winnr
  "endif
"endfunction
