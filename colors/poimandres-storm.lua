-- Poimandres Storm (Neovim)
-- Synced to “poimandres dark theme” (VS Code)

vim.cmd 'highlight clear'
if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end

vim.o.termguicolors = true
vim.g.colors_name = 'poimandres-storm'

-- Synced palette (from the VS Code theme)
local colors = {
  -- Accents
  yellow = '#FFFAC2',

  teal1 = '#5DE4C7',
  teal2 = '#5FB3A1',
  teal3 = '#42675A',

  blue1 = '#89DDFF',
  blue2 = '#ADD7FF',
  blue3 = '#91B4D5',
  blue4 = '#7390AA',

  pink2 = '#F087BD', -- VS Code “purple/magenta”
  pink3 = '#D0679D', -- errors

  -- Neutrals (VS Code foregrounds)
  blueGray1 = '#A6ACCD', -- main fg
  blueGray2 = '#868CAD', -- muted
  blueGray3 = '#404350', -- panels/selection-ish

  -- Background layers (VS Code uses editor bg for most surfaces)
  bg = '#252B37',
  bg_alt = '#252B37',
  bg_dark = '#202430',

  -- Text
  fg = '#A6ACCD', -- editor.foreground / foreground
  fg_bright = '#E4F0FB', -- “bright” text used in tokens
  white = '#FFFFFF',

  none = 'NONE',
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ======================
-- Core UI
-- ======================
hi('Normal', { fg = colors.fg, bg = colors.bg })
hi('NormalFloat', { fg = colors.fg, bg = colors.bg_alt })
hi('FloatBorder', { fg = colors.blueGray3, bg = colors.bg_alt })

hi('Cursor', { fg = colors.bg, bg = colors.blueGray1 })
hi('CursorLine', { bg = colors.blueGray3 })
hi('CursorLineNr', { fg = colors.blueGray1, bold = true })
hi('LineNr', { fg = colors.blueGray2 })

hi('Visual', { bg = colors.blueGray3 })
hi('Search', { fg = colors.bg, bg = colors.blue2 })
hi('IncSearch', { fg = colors.bg, bg = colors.blue1 })

hi('StatusLine', { fg = colors.fg_bright, bg = colors.blueGray3 })
hi('StatusLineNC', { fg = colors.blueGray2, bg = colors.bg })

hi('WinSeparator', { fg = colors.blueGray3 })
hi('VertSplit', { fg = colors.blueGray3 })

-- ======================
-- Menus
-- ======================
hi('Pmenu', { fg = colors.fg, bg = colors.bg_alt })
hi('PmenuSel', { fg = colors.fg_bright, bg = colors.blueGray3 })
hi('PmenuSbar', { bg = colors.blueGray3 })
hi('PmenuThumb', { bg = colors.blueGray2 })

-- ======================
-- Syntax (approx mapping from VS Code tokenColors)
-- ======================
hi('Comment', { fg = colors.blueGray2 })

hi('Constant', { fg = colors.teal1 })
hi('String', { fg = colors.teal1 })
hi('Character', { fg = colors.teal1 })
hi('Number', { fg = colors.teal1 })
hi('Boolean', { fg = colors.pink3 })

hi('Identifier', { fg = colors.fg_bright })
hi('Function', { fg = colors.blue2 })

hi('Statement', { fg = colors.blueGray1 })
hi('Keyword', { fg = colors.blueGray1 })
hi('Conditional', { fg = colors.blueGray1 })
hi('Repeat', { fg = colors.blueGray1 })
hi('Exception', { fg = colors.pink3 })

hi('Type', { fg = colors.blueGray1 })
hi('StorageClass', { fg = colors.blue3 }) -- VS Code uses #91B4D5 for storage/operator-ish
hi('Structure', { fg = colors.blueGray1 })

hi('Operator', { fg = colors.blue3 })
hi('Delimiter', { fg = colors.blueGray1 })

-- ======================
-- Diagnostics (LSP)
-- ======================
hi('DiagnosticError', { fg = colors.pink3 })
hi('DiagnosticWarn', { fg = colors.yellow })
hi('DiagnosticInfo', { fg = colors.blue2 })
hi('DiagnosticHint', { fg = colors.blue4 })

hi('DiagnosticVirtualTextError', { fg = colors.pink3, bg = colors.bg_dark })
hi('DiagnosticVirtualTextWarn', { fg = colors.yellow, bg = colors.bg_dark })
hi('DiagnosticVirtualTextInfo', { fg = colors.blue2, bg = colors.bg_dark })
hi('DiagnosticVirtualTextHint', { fg = colors.blue4, bg = colors.bg_dark })

-- ======================
-- Git / Diff
-- ======================
hi('DiffAdd', { fg = colors.teal2 })
hi('DiffChange', { fg = colors.blue2 })
hi('DiffDelete', { fg = colors.pink3 })

-- ======================
-- Tabs
-- ======================
hi('TabLine', { fg = colors.blueGray2, bg = colors.bg })
hi('TabLineSel', { fg = colors.fg_bright, bg = colors.blueGray3, bold = true })
hi('TabLineFill', { bg = colors.bg })

-- ======================
-- Tree-sitter (TypeScript etc.)
-- ======================
hi('@comment', { fg = colors.blueGray2 })

-- Variables / constants
hi('@variable', { fg = colors.blue3 })
hi('@variable.builtin', { fg = colors.blue3 })
hi('typescriptVariable', { fg = colors.teal1 }) -- or colors.blue2 / teal1, your call

hi('@constant', { fg = colors.teal1 })
hi('@constant.builtin', { fg = colors.teal1 })
hi('@constant.macro', { fg = colors.teal2 })

-- Literals
hi('@string', { fg = colors.teal1 })
hi('@string.escape', { fg = colors.pink2 })
hi('@number', { fg = colors.teal1 })
hi('@boolean', { fg = colors.pink3 })

-- Keywords / operators
hi('@keyword', { fg = colors.blueGray1 })
hi('@keyword.function', { fg = colors.blueGray1 })
hi('@operator', { fg = colors.blue3 })
hi('@punctuation.delimiter', { fg = colors.blueGray1 })
hi('@punctuation.bracket', { fg = colors.blueGray1 })

-- Functions / types / properties
hi('@function', { fg = colors.blue2 })
hi('@function.builtin', { fg = colors.blue2 })
hi('@type', { fg = colors.blueGray1 })
hi('@type.builtin', { fg = colors.blueGray1 })
hi('@property', { fg = colors.fg_bright })
hi('@field', { fg = colors.fg_bright })
hi('@parameter', { fg = colors.fg_bright })

-- ======================
-- TypeScript (vim syntax groups)
-- ======================

-- Keywords / statements
hi('typescriptStatementKeyword', { fg = colors.teal1 }) -- const/let/return/etc.
hi('typescriptKeyword', { fg = colors.blueGray1 })
hi('typescriptConditional', { fg = colors.blueGray1 })
hi('typescriptRepeat', { fg = colors.blueGray1 })
hi('typescriptException', { fg = colors.pink3 }) -- try/catch/throw-ish (varies by plugin)

-- Declarations / identifiers
hi('typescriptVariable', { fg = colors.teal1 }) -- stops “white variables”
hi('typescriptIdentifierName', { fg = colors.fg_bright }) -- if your plugin provides this
hi('typescriptFuncName', { fg = colors.blue2 })
hi('typescriptFuncKeyword', { fg = colors.blueGray1 }) -- function/async (varies)
hi('typescriptTypeReference', { fg = colors.blueGray1 })
hi('typescriptTypeParameter', { fg = colors.blueGray1 })

-- Punctuation / operators
hi('typescriptOperator', { fg = colors.blue3 })
hi('typescriptBinaryOp', { fg = colors.blue3 })
hi('typescriptAssign', { fg = colors.blue3 })

-- Literals
hi('typescriptString', { fg = colors.teal1 })
hi('typescriptNumber', { fg = colors.teal1 })
hi('typescriptBoolean', { fg = colors.pink3 })
