
if !exists('g:lspconfig')
  finish
endif

lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require('vim.lsp.protocol')


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>l', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --buf_set_keymap('n', '<C-j>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<S-C-j>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- formatting
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

  require'completion'.on_attach(client, bufnr)

  protocol.SymbolKind = { }
  protocol.CompletionItemKind = {
    ' Text', -- Text
    ' Method', -- Method
    ' Function', -- Function
    ' Constructor', -- Constructor
    ' Field', -- Field
    ' Variable', -- Variable
    ' Class', -- Class
    'ﰮ Interface', -- Interface
    ' Module', -- Module
    ' Property', -- Property
    ' Unit', -- Unit
    ' Value', -- Value
    ' Enum', -- Enum
    ' Keyword', -- Keyword
    '﬌ Snippet', -- Snippet
    ' Color', -- Color
    ' File', -- File
    ' Reference', -- Reference
    ' Folder', -- Folder
    ' EnumMember', -- EnumMember
    ' Constant', -- Constant
    ' Struct', -- Struct
    ' Event', -- Event
    'ﬦ Operator', -- Operator
    ' TypeParameter', -- TypeParameter
  }

end


nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
}

nvim_lsp.vuels.setup {
    on_attach = on_attach,
    filetypes = {"vue"},
    settings = {
    vetur = {
      experimental = {
        templateInterpolationService = true,
      },
      validation = {
        templateProps = true,
      },
      completion = {
        tagCasing = 'initial',
        autoImport = true,
        useScaffoldSnippets = true,
      },
    },
  },
--    init_options = {
--      config = {
--        css = {},
--        sass = {},
--        emmet = {},
--        html = {
--          suggest = {}
--        },
--        javascript = {
--          format = {}
--        },
--        stylusSupremacy = {},
--        typescript = {
--          format = {}
--        },
--        vetur = {
--          completion = {
--            autoImport = false,
--            tagCasing = "kebab",
--            useScaffoldSnippets = false
--          },
--          format = {
--            defaultFormatter = {
--              js = "none",
--              ts = "none"
--            },
--            defaultFormatterOptions = {},
--            scriptInitialIndent = false,
--            styleInitialIndent = false
--          },
--          useWorkspaceDependencies = false,
--          validation = {
--            script = true,
--            style = true,
--            template = true
--          }
--        }
--      }
--    }
}

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        }
      }
    }
}

EOF
