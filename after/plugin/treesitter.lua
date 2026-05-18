--vim.lsp.config('nvim-treesitter.configs', {
vim.lsp.config('nvim-treesitter', {
  configs = {
    highlight = {
      enable = true,
      -- disable = {"vue"},
      disable = {},
    },
    indent = {
      enable = true,
      disable = {},
    },
    ensure_installed = {
      "tsx",
      "html",
      --"toml",
      "json",
      "yaml",
      "html",
      "scss",
      "css",
      "vue",
      "typescript",
      --"sass",
      "python"
    },
}
})

--local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--parser_config.tsx.filetype_to_parsename = { "javascript", "typescript.tsx" }
--parser_config.vue.filetype_to_parsename = { "vue" }

