if !exists('g:lspconfig')
  finish
endif

lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

  -- Enable completion triggered by <c-x><c-o>
  -- Mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts) vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>l', vim.diagnostic.open_float, bufopts)
  vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)

  --protocol.SymbolKind = { }
  --protocol.CompletionItemKind = {
--    ' Text', -- Text
--    ' Method', -- Method
--    ' Function', -- Function
--    ' Constructor', -- Constructor
--    ' Field', -- Field
--    ' Variable', -- Variable
--    ' Class', -- Class
--    'ﰮ Interface', -- Interface
--    ' Module', -- Module
--    ' Property', -- Property
--    ' Unit', -- Unit
--    ' Value', -- Value
--    ' Enum', -- Enum
--    ' Keyword', -- Keyword
--    '﬌ Snippet', -- Snippet
--    ' Color', -- Color
--    ' File', -- File
--    ' Reference', -- Reference
--    ' Folder', -- Folder
--    ' EnumMember', -- EnumMember
--    ' Constant', -- Constant
--    ' Struct', -- Struct
--    ' Event', -- Event
--    'ﬦ Operator', -- Operator
--    ' TypeParameter', -- TypeParameter
--  }

end


nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150
    },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
      hostInfo = "neovim"
  },
  root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
}

nvim_lsp.vuels.setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    },
    filetypes = {"vue"},
    cmd = {"vls"},
    root_dir = nvim_lsp.util.root_pattern("package.json", "vue.config.js" ),
    init_options = {
      config = {
        css = {},
        sass = {},
        emmet = {},
        html = {
          suggest = {}
        },
        javascript = {
          format = {}
        },
        stylusSupremacy = {},
        typescript = {
          format = {}
        },
        vetur = {
          completion = {
            autoImport = false,
            tagCasing = "kebab",
            useScaffoldSnippets = false
          },
          format = {
            defaultFormatter = {
              js = "none",
              ts = "none"
            },
            defaultFormatterOptions = {},
            scriptInitialIndent = true,
            styleInitialIndent = true
          },
          useWorkspaceDependencies = false,
          validation = {
            script = true,
            style = true,
            template = true
          }
        }
      }
    }
}

nvim_lsp.pylsp.setup{
  on_attach = on_attach,
  cmd = { "pylsp" },
  filetypes = { "python" },
  single_file_support = false,
  flags = {
      debounce_text_changes = 200,
  },
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        -- codestyle
        pycodestyle = {
          ignore = {'W391', 'E501', 'E116'},
          maxLineLength = 80
        },
        autopep8 = {enabled = true},
        pyls_isort = { enabled = true },
        jedi_completion = { fuzzy = false }
      }
    }
  }
}


nvim_lsp.clangd.setup{
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    },
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_dir = nvim_lsp.util.root_pattern(
          '.clangd',
          '.clang-tidy',
          '.clang-format',
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git'
    ),
    single_file_support = true
}

nvim_lsp.cmake.setup{
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    cmd = { "cmake-language-server" },
    filetypes = { "cmake" },
    root_dir = nvim_lsp.util.root_pattern(
        'CMakePresets.json',
        'CTestConfig.cmake',
        '.git',
        'build',
        'cmake'
    ),
    single_file_support = true
}


nvim_lsp.dartls.setup{
    on_attach = on_attach,
    cmd = { "dart", "language-server", "--protocol=lsp" },
    filetypes = { "dart" },
    init_options = {
      closingLabels = true,
      flutterOutline = true,
      onlyAnalyzeProjectsWithOpenFiles = true,
      outline = true,
      suggestFromUnimportedLibraries = true
    },
    root_dir = nvim_lsp.util.root_pattern("pubspec.yaml"),
    settings = {
      dart = {
        completeFunctionCalls = true,
        showTodos = true
      }
    }
}

EOF

