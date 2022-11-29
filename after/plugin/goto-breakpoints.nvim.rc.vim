
lua << EOF

local map = vim.keymap.set
map('n', '<F7>', require('goto-breakpoints').next, {})
map('n', '<F6>', require('goto-breakpoints').prev, {})

EOF
