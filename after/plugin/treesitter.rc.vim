if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- disable = {"vue"},
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "html",
    --"toml",
    --"fish",
    --"php",
    "json",
    "yaml",
    --"swift",
    "html",
    "scss",
    "css",
    "vue",
    "typescript",
    --"sass",
    "python"
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsename = { "javascript", "typescript.tsx" }
parser_config.vue.filetype_to_parsename = { "vue" }
EOF
