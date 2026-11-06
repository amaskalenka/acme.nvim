-- Acme colorscheme for Neovim, a Lua port of plan9-for-vimspace/acme-colors.

if vim.g.colors_name then
  vim.cmd("highlight clear")
end
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "light"
vim.g.colors_name = "acme"

-- The original vim file uses the special names "fg" and "bg" for many groups;
-- they are resolved to concrete values here.
local g = {
  bg = "#ffffea",
  fg = "#000000",
  status = "#aeeeee",
  status_nc = "#eaffff",
  fold = "#cccc7c",
  fold_col = "#fcfcce",
  cursorline = "#ffffca",
  linenr = "#505050",
  constant = "#101010",
  comment = "#303030",
}

local c = {
  bg = 230,
  fg = 232, -- 'black' may be overridden by the terminal emulator; 232 is close enough
  status = 159,
  status_nc = 194,
  fold = 187,
  fold_col = 229,
  linenr = 239,
  constant = 233,
  comment = 236,
}

local groups = {
  Normal = { fg = g.fg, bg = g.bg, ctermfg = c.fg, ctermbg = c.bg },
  StatusLine = { fg = g.fg, bg = g.status, ctermfg = c.fg, ctermbg = c.status },
  StatusLineNC = { fg = g.fg, bg = g.status_nc, ctermfg = c.fg, ctermbg = c.status_nc },
  WildMenu = { fg = g.status_nc, bg = g.fg, ctermfg = c.status, ctermbg = 0 },
  VertSplit = { fg = g.fg, bg = g.bg, ctermfg = c.fg, ctermbg = c.status },
  Folded = { fg = g.fg, bg = g.fold, italic = true, ctermfg = c.fg, ctermbg = c.fold },
  FoldColumn = { fg = g.fg, bg = g.fold_col, ctermfg = c.fg, ctermbg = c.fold_col },
  Conceal = { fg = g.fg, bg = g.bg, ctermfg = c.fg, ctermbg = c.bg },
  LineNr = { fg = g.linenr, bg = g.bg, italic = true, ctermfg = c.linenr, ctermbg = c.bg },
  Visual = { fg = g.bg, bg = g.fg, ctermfg = c.bg, ctermbg = c.fg },
  CursorLine = { fg = g.fg, bg = g.cursorline, ctermfg = c.fg, ctermbg = c.bg },
  Pmenu = { fg = g.fg, bg = g.bg, ctermfg = c.fg, ctermbg = c.bg },
  PmenuSel = { fg = g.bg, bg = g.fg, ctermfg = c.bg, ctermbg = c.fg },

  Statement = { fg = g.fg, bg = g.bg, italic = true, ctermfg = c.fg, ctermbg = c.bg },
  Identifier = { fg = g.fg, bg = g.bg, bold = true, ctermfg = c.fg, ctermbg = c.bg },
  Type = { fg = g.fg, bg = g.bg, bold = true, ctermfg = c.fg, ctermbg = c.bg },
  PreProc = { fg = g.fg, bg = g.bg, bold = true, ctermfg = c.fg, ctermbg = c.bg },
  -- The original uses gui=bold but cterm=italic for Constant; kept as is.
  Constant = {
    fg = g.constant, bg = g.bg, bold = true,
    ctermfg = c.constant, ctermbg = c.bg, cterm = { italic = true },
  },
  Comment = { fg = g.comment, bg = g.bg, italic = true, ctermfg = c.comment, ctermbg = c.bg },
  Special = { fg = g.fg, bg = g.bg, bold = true, ctermfg = c.fg, ctermbg = c.bg },
  SpecialKey = { fg = g.fg, bg = g.bg, bold = true, ctermfg = c.fg, ctermbg = c.bg },
  -- NonText is set twice in the original; the later (bold, fg-colored) one wins.
  NonText = { fg = g.fg, bg = g.bg, bold = true, ctermfg = c.fg, ctermbg = c.bg },
  Directory = { fg = g.fg, bg = g.bg, bold = true, ctermfg = c.fg, ctermbg = c.bg },

  -- Not in the original: Neovim UI groups, so floats and the gutter match the theme.
  NormalFloat = { link = "Pmenu" },
  FloatBorder = { link = "Normal" },
  SignColumn = { fg = g.fg, bg = g.bg, ctermfg = c.fg, ctermbg = c.bg },
  EndOfBuffer = { fg = g.bg, bg = g.bg, ctermfg = c.bg, ctermbg = c.bg },

  Title = { link = "Directory" },
  MoreMsg = { link = "Comment" },
  Question = { link = "Comment" },
  vimFunction = { link = "Identifier" },
}

-- nvim_set_hl mirrors bold/italic to cterm unless a cterm table is given.
for name, def in pairs(groups) do
  vim.api.nvim_set_hl(0, name, def)
end

