-- Color palette
local colors = {
  bg = "#141D22",
  fg = "#A5FBFF",
  gray = "#3a4c4e",
  dark_gray = "#1e2628", -- Darker version for subtle highlights
  light_gray = "#91b0b1",
  red = "#dd513c",
  green = "#3df2ad",
  blue = "#34A2DF",
  cyan = "#4DDCFF",
  light_blue = "#A5FBFF",
  dark_blue = "#3f9bbc",
  orange = "#ffb78a",
  pink = "#eb78c3",
  warning = "#FFFF84",
  border = "#154547",
}

local M = {}

-- Lualine theme
M.lualine = {
  normal = {
    a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.light_gray, bg = colors.bg }
  },
  insert = {
    a = { fg = colors.bg, bg = colors.green, gui = "bold" },
  },
  visual = {
    a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
  },
  replace = {
    a = { fg = colors.bg, bg = colors.red, gui = "bold" },
  },
  command = {
    a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
  },
  inactive = {
    a = { fg = colors.gray, bg = colors.bg },
    b = { fg = colors.gray, bg = colors.bg },
    c = { fg = colors.gray, bg = colors.bg }
  }
}

function M.setup()
  local highlight = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Reset all highlights
  vim.cmd('highlight clear')
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  -- Set colorscheme name
  vim.g.colors_name = 'nostromo'

  -- Editor highlights
  local editor = {
    -- Basic UI elements
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg },
    SignColumn = { bg = colors.bg },
    MsgArea = { fg = colors.fg, bg = colors.bg },
    ModeMsg = { fg = colors.fg, bold = true },
    CursorLine = { bg = colors.bg },
    CursorLineNr = { fg = colors.fg },
    LineNr = { fg = colors.gray },
    ColorColumn = { bg = colors.dark_gray },
    Cursor = { fg = colors.fg },
    -- Split borders (invisible)
    VertSplit = { fg = colors.bg },
    WinSeparator = { fg = colors.bg }, -- For newer versions of Neovim
    StatusLine = { fg = colors.gray, bg = colors.bg },
    StatusLineNC = { fg = colors.gray, bg = colors.bg },
    FloatBorder = { fg = colors.border },
    MatchParen = { fg = colors.cyan, bold = true },
    NonText = { fg = colors.gray },

    -- Status line
    StatusLine = { fg = colors.light_gray, bg = colors.bg },
    StatusLineNC = { fg = colors.gray, bg = colors.bg },

    -- Tab line
    TabLine = { fg = colors.gray, bg = colors.bg },
    TabLineFill = { bg = colors.bg },
    TabLineSel = { fg = colors.fg, bg = colors.border },

    -- Completion menu
    Pmenu = { fg = colors.light_gray, bg = colors.bg },
    PmenuSel = { fg = colors.fg, bg = colors.border },
    PmenuSbar = { bg = colors.bg },
    PmenuThumb = { bg = colors.border },

    -- Search
    Search = { fg = colors.bg, bg = colors.blue },
    IncSearch = { fg = colors.bg, bg = colors.blue },

    -- Visual mode
    Visual = { bg = colors.border },
    VisualNOS = { bg = colors.border },

    -- Diagnostics
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.warning },
    DiagnosticInfo = { fg = colors.blue },
    DiagnosticHint = { fg = colors.green },
  }

  -- Syntax highlights
  local syntax = {
    Comment = { fg = colors.gray, italic = true },
    Constant = { fg = colors.green },
    String = { fg = colors.dark_blue },
    Character = { fg = colors.dark_blue },
    Number = { fg = colors.cyan },
    Boolean = { fg = colors.cyan },
    Float = { fg = colors.cyan },
    Identifier = { fg = colors.fg },
    Function = { fg = colors.green },
    Statement = { fg = colors.red },
    Conditional = { fg = colors.red },
    Repeat = { fg = colors.red },
    Label = { fg = colors.red },
    Operator = { fg = colors.red },
    Keyword = { fg = colors.red },
    Exception = { fg = colors.red },
    PreProc = { fg = colors.green },
    Include = { fg = colors.red },
    Define = { fg = colors.red },
    Macro = { fg = colors.green },
    Type = { fg = colors.cyan },
    StorageClass = { fg = colors.red },
    Structure = { fg = colors.cyan },
    Special = { fg = colors.blue },
    SpecialChar = { fg = colors.dark_blue },
    Tag = { fg = colors.red },
    SpecialComment = { fg = colors.gray, italic = true },
  }

  -- Tree-sitter highlights
  local treesitter = {
    ["@comment"] = { fg = colors.gray, italic = true },
    ["@error"] = { fg = colors.red },
    ["@none"] = { fg = colors.fg },
    ["@preproc"] = { link = "PreProc" },
    ["@define"] = { link = "Define" },
    ["@operator"] = { link = "Operator" },

    -- Punctuation
    ["@punctuation.delimiter"] = { fg = colors.fg },
    ["@punctuation.bracket"] = { fg = colors.fg },
    ["@punctuation.special"] = { fg = colors.blue },

    -- Literals
    ["@string"] = { link = "String" },
    ["@string.regex"] = { fg = colors.dark_blue },
    ["@string.escape"] = { fg = colors.cyan },
    ["@string.special"] = { fg = colors.cyan },
    ["@character"] = { link = "Character" },
    ["@number"] = { link = "Number" },
    ["@boolean"] = { link = "Boolean" },
    ["@float"] = { link = "Float" },

    -- Functions
    ["@function"] = { fg = colors.green },
    ["@function.call"] = { fg = colors.green },
    ["@function.builtin"] = { fg = colors.green },
    ["@function.macro"] = { fg = colors.green },
    ["@method"] = { fg = colors.green },
    ["@method.call"] = { fg = colors.green },
    ["@constructor"] = { fg = colors.cyan },
    ["@parameter"] = { fg = colors.light_gray },

    -- Keywords
    ["@keyword"] = { fg = colors.red },
    ["@keyword.function"] = { fg = colors.red },
    ["@keyword.operator"] = { fg = colors.red },
    ["@keyword.return"] = { fg = colors.red },

    -- Types
    ["@type"] = { fg = colors.cyan },
    ["@type.builtin"] = { fg = colors.cyan },
    ["@type.qualifier"] = { fg = colors.red },
    ["@type.definition"] = { fg = colors.cyan },

    -- Identifiers
    ["@variable"] = { fg = colors.fg },
    ["@variable.builtin"] = { fg = colors.green },
    ["@constant"] = { fg = colors.green },
    ["@constant.builtin"] = { fg = colors.green },
    ["@constant.macro"] = { fg = colors.green },
    ["@namespace"] = { fg = colors.green },
    ["@symbol"] = { fg = colors.blue },
  }

  -- Set all highlights
  for group, opts in pairs(editor) do
    highlight(group, opts)
  end

  for group, opts in pairs(syntax) do
    highlight(group, opts)
  end

  for group, opts in pairs(treesitter) do
    highlight(group, opts)
  end

  -- Terminal colors
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_3 = colors.orange
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.pink
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_8 = colors.gray
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_11 = colors.orange
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_13 = colors.pink
  vim.g.terminal_color_14 = colors.cyan
  vim.g.terminal_color_15 = colors.fg
end

return M
