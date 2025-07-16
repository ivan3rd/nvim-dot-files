local lspconfig = require('lspconfig')

--local opts = { noremap=true, silent=true }
--local on_attach = function(client, bufnr)
    --print('on_attach was called')

  ---- Enable completion triggered by <c-x><c-o>
  ---- Mappings.
  --local bufopts = { noremap=true, silent=true, buffer=bufnr }

  ---- See `:help vim.lsp.*` for documentation on any of the below functions
  --vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  --vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  --vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts) vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  --vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  --vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  --vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  --vim.keymap.set('n', '<space>l', vim.diagnostic.open_float, bufopts)
  --vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

--end


vim.lsp.config('*', {
    capabilities = {
        textDocument = {
            multilineTokenSupport = true
        }
    },
    root_markers = {'.git'}
})


vim.lsp.config('basedpyright', {
  cmd={ "basedpyright-langserver", "--stdio" },
  filetypes={ "python" },
  root_markers={ "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" },
  settings={
      python = {
        pythonPath = './venv',
        venvPath = './venv',
    },
      basedpyright = {
        analysis = {
          typeCheckingMode = 'basic',
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          useLibraryCodeForTypes = true
        }
      }
    }
})

--vim.lsp.config('pylsp', {
    --cmd = { "pylsp" },
    --filetypes = { "python" },
    --single_file_support = false,
    --root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
    --settings = {
        --pylsp = {
            --plugins = {
                --pycodestyle = {
                    --ignore = {'W391', 'E501', 'E116'},
                    --maxLineLength = 80
                --},
                --autopep8 = {enabled = true},
                --pyls_isort = { enabled = true },
                --jedi_completion = { fuzzy = false }
            --}
        --}
    --}
--})

--local lsp_attach_group = vim.api.nvim_create_augroup('UserLspAttach', {})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local opts = { noremap=true, silent=true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gl', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', 'gk', vim.diagnostic.open_float, bufopts)
    --vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
  end,
})
