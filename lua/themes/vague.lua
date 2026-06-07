-- Vague Theme Configuration
local M = {}

M.base_30 = {
  white = "#cdcdcd",
  darker_black = "#0f0f10",
  black = "#141415",
  black2 = "#1a1a1f",
  one_bg = "#1c1c24",
  one_bg2 = "#252530",
  one_bg3 = "#2d2d35",
  grey = "#404050",
  grey_fg = "#606079",
  grey_fg2 = "#878787",
  light_grey = "#a0a0b0",
  red = "#d8647e",
  baby_pink = "#e8a0a0",
  pink = "#d8647e",
  line = "#252530",
  green = "#7fa563",
  vibrant_green = "#8fb573",
  nord_blue = "#6e94b2",
  blue = "#7e98e8",
  yellow = "#e0a363",
  sun = "#f3be7c",
  purple = "#bb9dbd",
  dark_purple = "#9b7ea8",
  teal = "#7faf9f",
  orange = "#e8b589",
  cyan = "#b4d4cf",
  statusline_bg = "#141415",
  lightbg = "#1c1c24",
  pmenu_bg = "#7fa563",
  folder = "#6e94b2",
}

M.base_16 = {
  base00 = "#141415",
  base01 = "#1c1c24",
  base02 = "#252530",
  base03 = "#2d2d35",
  base04 = "#404050",
  base05 = "#cdcdcd",
  base06 = "#878787",
  base07 = "#e8b589",
  base08 = "#d8647e",
  base09 = "#f3be7c",
  base0A = "#e0a363",
  base0B = "#7fa563",
  base0C = "#b4d4cf",
  base0D = "#6e94b2",
  base0E = "#bb9dbd",
  base0F = "#e8b589",
}

M.polish_hl = {
  -- Syntax highlighting
  Comment = { fg = M.base_30.grey_fg },
  String = { fg = M.base_30.orange },
  Number = { fg = M.base_30.yellow },
  Boolean = { fg = M.base_30.purple },
  Function = { fg = M.base_30.red },
  Keyword = { fg = M.base_30.nord_blue },
  Type = { fg = M.base_30.cyan },
  Variable = { fg = M.base_30.white },
  Operator = { fg = M.base_30.light_grey },

  -- UI Elements
  Normal = { fg = M.base_30.white, bg = M.base_30.black },
  NormalFloat = { fg = M.base_30.white, bg = M.base_30.one_bg },
  FloatBorder = { fg = M.base_30.grey_fg2 },
  LineNr = { fg = M.base_30.grey },
  CursorLineNr = { fg = M.base_30.white, bold = true },
  CursorLine = { bg = M.base_30.one_bg2 },
  Visual = { bg = "#333738" },
  Search = { bg = "#405065" },
  IncSearch = { fg = M.base_30.black, bg = M.base_30.yellow },

  -- Status line & tab line
  StatusLine = { fg = M.base_30.white, bg = M.base_30.one_bg2 },
  TabLine = { fg = M.base_30.grey, bg = M.base_30.one_bg },
  TabLineSel = { fg = M.base_30.white, bg = M.base_30.one_bg2, bold = true },

  -- Diagnostics
  DiagnosticError = { fg = M.base_30.red },
  DiagnosticWarn = { fg = M.base_30.sun },
  DiagnosticInfo = { fg = M.base_30.blue },
  DiagnosticHint = { fg = M.base_30.blue },

  -- LSP
  LspReferenceText = { bg = M.base_30.one_bg3 },
  LspReferenceRead = { bg = M.base_30.one_bg3 },
  LspReferenceWrite = { bg = M.base_30.one_bg3 },

  -- TreeSitter
  TSComment = { fg = M.base_30.grey_fg },
  TSString = { fg = M.base_30.orange },
  TSNumber = { fg = M.base_30.yellow },
  TSBoolean = { fg = M.base_30.purple },
  TSFunction = { fg = M.base_30.red },
  TSKeyword = { fg = M.base_30.nord_blue },
  TSType = { fg = M.base_30.cyan },
}

M.type = "dark"

return M
