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

--vim.lsp.config('ts_ls', {
  --init_options = {
    --hostInfo = 'neovim'
    ----hostInfo = 'neovim',
    ----plugins = {
      ----name = '@vue/typescript-plugin',
      ----location = vue_language_server,
      ----languages = {'vue'}
    ----}
  --},
  --cmd = { 'typescript-language-server', '--stdio' },
  --filetypes = {
    --'javascript',
    --'javascriptreact',
    --'javascript.jsx',
    --'typescript',
    --'typescriptreact',
    --'typescript.tsx',
    --'vue',
  --},
  --root_dir = function(bufnr, on_dir)
    ---- The project root is where the LSP can be started from
    ---- As stated in the documentation above, this LSP supports monorepos and simple projects.
    ---- We select then from the project root, which is identified by the presence of a package
    ---- manager lock file.
    --local project_root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb' }
    --local project_root = vim.fs.root(bufnr, project_root_markers)
    --if not project_root then
      --return nil
    --end

    ---- We know that the buffer is using Typescript if it has a config file
    ---- in its directory tree.
    --local ts_config_files = { 'tsconfig.json', 'jsconfig.json' }
    --local is_buffer_using_typescript = vim.fs.find(ts_config_files, {
      --path = vim.api.nvim_buf_get_name(bufnr),
      --type = 'file',
      --limit = 1,
      --upward = true,
      --stop = vim.fs.dirname(project_root),
    --})[1]
    --if not is_buffer_using_typescript then
      --return nil
    --end

    --on_dir(project_root)
  --end,
  --handlers = {
    ---- handle rename request for certain code actions like extracting functions / types
    --['_typescript.rename'] = function(_, result, ctx)
      --local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
      --vim.lsp.util.show_document({
        --uri = result.textDocument.uri,
        --range = {
          --start = result.position,
          --['end'] = result.position,
        --},
      --}, client.offset_encoding)
      --vim.lsp.buf.rename()
      --return vim.NIL
    --end,
  --},
  --commands = {
    --['editor.action.showReferences'] = function(command, ctx)
      --local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
      --local file_uri, position, references = unpack(command.arguments)

      --local quickfix_items = vim.lsp.util.locations_to_items(references, client.offset_encoding)
      --vim.fn.setqflist({}, ' ', {
        --title = command.title,
        --items = quickfix_items,
        --context = {
          --command = command,
          --bufnr = ctx.bufnr,
        --},
      --})

      --vim.lsp.util.show_document({
        --uri = file_uri,
        --range = {
          --start = position,
          --['end'] = position,
        --},
      --}, client.offset_encoding)

      --vim.cmd('botright copen')
    --end,
  --},
  --on_attach = function(client, bufnr)
     ----ts_ls provides `source.*` code actions that apply to the whole file. These only appear in
    ---- `vim.lsp.buf.code_action()` if specified in `context.only`.
    --vim.api.nvim_buf_create_user_command(bufnr, 'LspTypescriptSourceAction', function()
      --local source_actions = vim.tbl_filter(function(action)
        --return vim.startswith(action, 'source.')
      --end, client.server_capabilities.codeActionProvider.codeActionKinds)

      --vim.lsp.buf.code_action({
        --context = {
          --only = source_actions,
        --},
      --})
    --end, {})
  --end,
--})
--vim.lsp.enable('ts_ls')


local vue_language_server_path = '/usr/lib/node_modules/@vue/language-server'
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
vim.lsp.config('vtsls', {
  cmd = {'vtsls', '--stdio'},
  init_options = { hostInfo = 'neovim' },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})
vim.lsp.enable('vtsls')


--local lsp_attach_group = vim.api.nvim_create_augroup('UserLspAttach', {})
vim.lsp.enable('vue_ls')
vim.lsp.config('vue_ls', {
  cmd={ "vue-language-server", "--stdio" },
  filetypes={ "vue" },
  root_markers={ "package.json" },
  --on_init = function(client)
    --local retries = 0

    -----@param _ lsp.ResponseError
    -----@param result any
    -----@param context lsp.HandlerContext
    --local function typescriptHandler(_, result, context)
      --local ts_client = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'ts_ls' })[1]
        --or vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })[1]
        --or vim.lsp.get_clients({ bufnr = context.bufnr, name = 'typescript-tools' })[1]

      --if not ts_client then
        ---- there can sometimes be a short delay until `ts_ls`/`vtsls` are attached so we retry for a few times until it is ready
        --if retries <= 10 then
          --retries = retries + 1
          --vim.defer_fn(function()
            --typescriptHandler(_, result, context)
          --end, 100)
        --else
          --vim.notify(
            --'Could not find `ts_ls`, `vtsls`, or `typescript-tools` lsp client required by `vue_ls`.',
            --vim.log.levels.ERROR
          --)
        --end
        --return
      --end

      --local param = unpack(result)
      --local id, command, payload = unpack(param)
      --ts_client:exec_cmd({
        --title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
        --command = 'typescript.tsserverRequest',
        --arguments = {
          --command,
          --payload,
        --},
      --}, { bufnr = context.bufnr }, function(_, r)
        --local response_data = { { id, r and r.body } }
        -----@diagnostic disable-next-line: param-type-mismatch
        --client:notify('tsserver/response', response_data)
      --end)
    --end

    --client.handlers['tsserver/request'] = typescriptHandler
  --end,
})


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
