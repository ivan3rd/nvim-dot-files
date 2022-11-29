lua << EOF
local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    --runInTerminal = true,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
  {
      -- If you get an "Operation not permitted" error using this, try disabling YAMA:
      --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
      name = "Attach to process",
      type = 'cpp',  -- Adjust this to match your adapter name (`dap.adapters.<name>`)
      request = 'attach',
      pid = require('dap.utils').pick_process,
      args = {},
  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
--dap.configurations.rust = dap.configurations.cpp

--keymaps
vim.keymap.set("n","<F5>",":lua require'dap'.continue()<CR>")
vim.keymap.set("n","<F8>",":lua require'dap'.step_over()<CR>")
vim.keymap.set("n","<F9>",":lua require'dap'.step_into()<CR>")
vim.keymap.set("n","<F10>",":lua require'dap'.step_out()<CR>")
vim.keymap.set("n","<Leader>b",":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n","<Leader>B",":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n","<Leader>lp",":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n","<Leader>dr",":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n","<Leader>dl",":lua require'dap'.run_last()<CR>")

EOF
