-- colors/nostromo.lua
local M = {}

-- Color palette
M.colors = {
  bg = "#141D22",
  fg = "#A5FBFF",
  gray = "#3a4c4e",
  light_gray = "#91b0b1",
  blue = "#34A2DF",
  light_blue = "#4DDCFF",
  green = "#3df2ad",
  orange = "#ffb78a",
  pink = "#eb78c3",
  red = "#dd513c",
  string_blue = "#3f9bbc",
  border = "#154547",
  selection = "#cdf1f311",
  warning = "#FFFF84",
  error = "#913f4c",
}

M.groups = {
  Normal = { fg = M.colors.fg, bg = M.colors.bg },
  NormalFloat = { fg = M.colors.fg, bg = M.colors.bg },
  Comment = { fg = M.colors.gray },
  Cursor = { fg = M.colors.bg, bg = M.colors.fg },
  CursorLine = { bg = M.colors.selection },
  CursorLineNr = { fg = M.colors.fg },
  LineNr = { fg = M.colors.gray },

  -- Syntax highlighting
  Constant = { fg = M.colors.green },
  String = { fg = M.colors.string_blue },
  Character = { fg = M.colors.string_blue },
  Number = { fg = M.colors.light_blue },
  Boolean = { fg = M.colors.light_blue },
  Float = { fg = M.colors.light_blue },

  Identifier = { fg = M.colors.fg },
  Function = { fg = M.colors.green },

  Statement = { fg = M.colors.red },
  Keyword = { fg = M.colors.red },
  Conditional = { fg = M.colors.red },
  Repeat = { fg = M.colors.red },
  Label = { fg = M.colors.red },
  Operator = { fg = M.colors.fg },
  Exception = { fg = M.colors.red },

  PreProc = { fg = M.colors.red },
  Include = { fg = M.colors.red },
  Define = { fg = M.colors.red },
  Macro = { fg = M.colors.green },
  PreCondit = { fg = M.colors.red },

  Type = { fg = M.colors.light_blue },
  StorageClass = { fg = M.colors.red },
  Structure = { fg = M.colors.light_blue },
  Typedef = { fg = M.colors.light_blue },

  Special = { fg = M.colors.orange },

  -- Treesitter
  ["@keyword"] = { fg = M.colors.red },
  ["@keyword.function"] = { fg = M.colors.red },
  ["@keyword.operator"] = { fg = M.colors.red },
  ["@keyword.return"] = { fg = M.colors.red },

  ["@function"] = { fg = M.colors.green },
  ["@function.call"] = { fg = M.colors.green },
  ["@function.builtin"] = { fg = M.colors.green },
  ["@function.macro"] = { fg = M.colors.green },

  ["@type"] = { fg = M.colors.light_blue },
  ["@type.builtin"] = { fg = M.colors.light_blue },
  ["@type.definition"] = { fg = M.colors.light_blue },
  ["@type.qualifier"] = { fg = M.colors.red },

  ["@variable"] = { fg = M.colors.fg },
  ["@variable.builtin"] = { fg = M.colors.green },

  ["@constant"] = { fg = M.colors.green },
  ["@constant.builtin"] = { fg = M.colors.green },
  ["@constant.macro"] = { fg = M.colors.green },

  ["@string"] = { fg = M.colors.string_blue },
  ["@string.escape"] = { fg = M.colors.orange },

  ["@comment"] = { fg = M.colors.gray },

  -- UI elements
  Pmenu = { fg = M.colors.light_gray, bg = M.colors.bg },
  PmenuSel = { fg = M.colors.fg, bg = M.colors.selection },
  PmenuSbar = { bg = M.colors.bg },
  PmenuThumb = { bg = M.colors.selection },

  StatusLine = { fg = M.colors.light_gray, bg = M.colors.bg },
  StatusLineNC = { fg = M.colors.gray, bg = M.colors.bg },

  TabLine = { fg = M.colors.gray, bg = M.colors.bg },
  TabLineFill = { bg = M.colors.bg },
  TabLineSel = { fg = M.colors.fg, bg = M.colors.selection },

  Search = { fg = M.colors.bg, bg = M.colors.blue },
  IncSearch = { fg = M.colors.bg, bg = M.colors.green },

  Visual = { bg = M.colors.selection },
  VisualNOS = { bg = M.colors.selection },

  DiagnosticError = { fg = M.colors.error },
  DiagnosticWarn = { fg = M.colors.warning },
  DiagnosticInfo = { fg = M.colors.blue },
  DiagnosticHint = { fg = M.colors.green },
}

-- Lualine theme
M.lualine = {
  normal = {
    a = { fg = M.colors.bg, bg = M.colors.blue, gui = "bold" },
    b = { fg = M.colors.fg, bg = M.colors.bg },
    c = { fg = M.colors.light_gray, bg = M.colors.bg }
  },
  insert = {
    a = { fg = M.colors.bg, bg = M.colors.green, gui = "bold" },
  },
  visual = {
    a = { fg = M.colors.bg, bg = M.colors.orange, gui = "bold" },
  },
  replace = {
    a = { fg = M.colors.bg, bg = M.colors.red, gui = "bold" },
  },
  command = {
    a = { fg = M.colors.bg, bg = M.colors.light_blue, gui = "bold" },
  },
  inactive = {
    a = { fg = M.colors.gray, bg = M.colors.bg },
    b = { fg = M.colors.gray, bg = M.colors.bg },
    c = { fg = M.colors.gray, bg = M.colors.bg }
  }
}

-- Setup function
function M.setup()
  if vim.version().minor < 8 then
    vim.notify("Nostromo theme requires Neovim 0.8+", vim.log.levels.ERROR)
    return
  end

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "nostromo"

  -- Apply highlight groups
  for group, settings in pairs(M.groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
