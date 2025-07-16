require("which-key").setup {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
    enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
    suggestions = 5, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  --triggers = {
    ---- list of mode / prefixes that should never be hooked by WhichKey
    ---- this is mostly relevant for key maps that start with a native binding
    ---- most people should not need to change this
    --i = { "<Leader>" },
    --v = {  },
  --},
}


