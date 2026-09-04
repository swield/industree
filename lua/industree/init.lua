-- The Neovim half of industree: treesitter, LSP diagnostics and plugin UI.
-- The traditional groups live in colors/industree.vim, shared with Vim, and
-- link() reaches them from here.

local M = {}

local P = {
  bg = "#0e1b21", -- Normal background
  bg_alt = "#18252c", -- Folded, Pmenu background
  bg_hi = "#1b292f", -- CursorLine, StatusLine background
  bg_sel = "#004968", -- Visual
  bg_ref = "#233c49", -- LspReference, illuminate background
  border = "#2f3e46", -- VertSplit

  fg = "#c8e7f7", -- Normal
  comment = "#678493", -- Comment
  string = "#caf3dd", -- String
  char = "#edc7c0", -- Character, @character
  lspmacro = "#d9fdff", -- @lsp.type.macro
  focus = "#dcede3", -- picker match, flash, active parameter, IncSearch bg
  func = "#00ffd7", -- Function
  keyword = "#a7edec", -- Statement, less control flow (ctrl) and return (ret)
  preproc = "#238b8a", -- PreProc
  type = "#00ffaf", -- Type
  special = "#74b9b8", -- Special, same value as ret

  member = "#bde9ff", -- cCustomMemVar, @property, @variable.member

  op = "#a2bebd", -- @operator, Operator, cCustomDot, cCustomPtr
  param = "#eaf8ff", -- @variable.parameter, italic on top
  ctrl = "#cbf5f4", -- @keyword.conditional, @keyword.repeat
  ret = "#74b9b8", -- @keyword.return
  muted = "#7a98a7", -- StatusLineNC
  linenr = "#4b6775", -- LineNr, GitSignsCurrentLineBlame, LspCodeLens
  inlay = "#577382", -- LspInlayHint
  dim = "#3e5967", -- What should recede: indent guide, flash backdrop

  -- Six headings. Same values as htmlH1-H6.
  heading = { "#d9fdff", "#00ffd7", "#00ffaf", "#a7edec", "#74b9b8", "#238b8a" },

  info = "#49a9ff", -- DiagnosticInfo and the change family (Changed, diffChanged, DiffviewStatusModified)
  hint = "#d0cded", -- DiagnosticHint
  error = "#ff223a", -- DiagnosticError, DapBreakpoint, Diffview delete
  warn = "#ffca00", -- DiagnosticWarn, DapBreakpointCondition
  ok = "#00ffaf", -- DiagnosticOk, DapStopped, Diffview add. Same value as type

  diff_add = "#0f2f1a",
  diff_del = "#2f1216",
  diff_txt = "#12474a",
}

M.palette = P

local function hl(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

local function link(group, target)
  vim.api.nvim_set_hl(0, group, { link = target })
end

function M.apply()
  for i, c in ipairs(vim.g.terminal_ansi_colors or {}) do
    vim.g["terminal_color_" .. (i - 1)] = c
  end

  if not vim.g.industree_no_termguicolors then
    vim.o.termguicolors = true
  end

  -----------------------------------------------------------------------------
  -- 1. treesitter
  -----------------------------------------------------------------------------
  link("@comment", "Comment")
  link("@string", "String")
  link("@character", "Character")
  link("@number", "Number")
  link("@boolean", "Boolean")
  link("@keyword", "Statement")
  hl("@keyword.return", { fg = P.ret })
  hl("@keyword.conditional", { fg = P.ctrl })
  hl("@keyword.repeat", { fg = P.ctrl })
  hl("@keyword.type", { fg = P.type }) -- struct, union, enum, typedef
  link("@keyword.directive", "PreProc")
  link("@keyword.import", "PreProc")
  link("@type", "Type")
  link("@type.builtin", "Type")
  link("@constant", "Constant")
  link("@constant.builtin", "Constant")
  hl("@lsp.type.macro", { fg = P.lspmacro })
  hl("@operator", { fg = P.op })
  link("@punctuation.bracket", "Delimiter")
  link("@punctuation.delimiter", "Delimiter")
  link("@punctuation.special", "Special")

  hl("@variable", { fg = P.fg })
  hl("@variable.parameter", { fg = P.param, italic = true })
  hl("@variable.member", { fg = P.member })
  hl("@property", { fg = P.member })
  hl("@field", { fg = P.member })
  hl("@function", { fg = P.func })
  hl("@function.call", { fg = P.func })
  hl("@function.builtin", { fg = P.func, italic = true })
  hl("@function.macro", { fg = P.func })
  hl("@module", { fg = P.type })
  hl("@label", { fg = P.special })
  hl("@keyword.modifier", { fg = P.keyword })
  hl("@type.qualifier", { fg = P.keyword })
  hl("@storageclass", { fg = P.keyword })
  hl("@constructor", { fg = P.type })
  hl("@attribute", { fg = P.preproc })

  -----------------------------------------------------------------------------
  -- 1-2. markup (shared by markdown, vimdoc, rst, latex)
  -----------------------------------------------------------------------------
  for i, color in ipairs(P.heading) do
    hl("@markup.heading." .. i, { fg = color, bold = true })
  end

  link("@markup.quote", "Comment")
  link("@markup.list", "Special")
  link("@markup.math", "Special")
  hl("@markup.raw", { fg = P.func })
  hl("@markup.link", { fg = P.type, underline = true })

  hl("@markup.strong", { bold = true })
  hl("@markup.italic", { italic = true })

  link("@tag.delimiter", "Delimiter")
  link("@tag.attribute", "Type")

  -----------------------------------------------------------------------------
  -- 2. LSP diagnostics and reference highlights
  -----------------------------------------------------------------------------
  hl("DiagnosticError", { fg = P.error })
  hl("DiagnosticWarn", { fg = P.warn })
  hl("DiagnosticInfo", { fg = P.info })
  hl("DiagnosticHint", { fg = P.hint })
  hl("DiagnosticOk", { fg = P.ok })
  hl("DiagnosticUnnecessary", { fg = P.comment, italic = false })

  hl("DiagnosticUnderlineError", { undercurl = true, sp = P.error })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = P.warn })
  hl("DiagnosticUnderlineInfo", { undercurl = true, sp = P.info })
  hl("DiagnosticUnderlineHint", { undercurl = true, sp = P.hint })
  hl("DiagnosticUnderlineOk", { undercurl = true, sp = P.ok })

  hl("DiagnosticVirtualTextError", { fg = P.error, bg = P.bg_alt })
  hl("DiagnosticVirtualTextWarn", { fg = P.warn, bg = P.bg_alt })
  hl("DiagnosticVirtualTextInfo", { fg = P.info, bg = P.bg_alt })
  hl("DiagnosticVirtualTextHint", { fg = P.hint, bg = P.bg_alt })

  hl("LspReferenceText", { bg = P.bg_ref, bold = true })
  hl("LspReferenceRead", { bg = P.bg_ref, bold = true })
  hl("LspReferenceWrite", { bg = P.bg_ref, bold = true })
  hl("IlluminatedWordText", { bg = P.bg_ref, bold = true })
  hl("IlluminatedWordRead", { bg = P.bg_ref, bold = true })
  hl("IlluminatedWordWrite", { bg = P.bg_ref, bold = true })

  hl("LspInlayHint", { fg = P.inlay, bg = P.bg_alt })
  hl("LspSignatureActiveParameter", { fg = P.focus, bold = true })
  hl("LspCodeLens", { fg = P.linenr, italic = true })

  -----------------------------------------------------------------------------
  -- 3. Editor UI groups that only Neovim has
  -----------------------------------------------------------------------------
  hl("WinSeparator", { fg = P.border })
  hl("FloatBorder", { fg = P.linenr, bg = P.bg_alt })
  hl("NormalFloat", { fg = P.fg, bg = P.bg_alt })
  hl("FloatTitle", { fg = P.func, bg = P.bg_alt, bold = true })
  hl("WinBar", { fg = P.fg, bg = P.bg_hi, bold = true })
  hl("WinBarNC", { fg = P.muted, bg = P.bg_alt })
  link("TermCursor", "Cursor")

  hl("DiagnosticSignError", { fg = P.error })
  hl("DiagnosticSignWarn", { fg = P.warn })
  hl("DiagnosticSignInfo", { fg = P.info })
  hl("DiagnosticSignHint", { fg = P.hint })

  -----------------------------------------------------------------------------
  -- 4. gitsigns
  -----------------------------------------------------------------------------
  hl("GitSignsAddInline", { bg = P.diff_add })
  hl("GitSignsChangeInline", { bg = P.diff_txt })
  hl("GitSignsDeleteInline", { bg = P.diff_del })
  hl("GitSignsCurrentLineBlame", { fg = P.linenr, italic = true })

  -----------------------------------------------------------------------------
  -- 5. snacks (picker, indent, notify, dashboard)
  -----------------------------------------------------------------------------
  hl("SnacksPickerMatch", { fg = P.focus, bold = true })
  hl("SnacksPickerDir", { fg = P.muted })
  hl("SnacksPickerPathHidden", { fg = P.linenr })
  hl("SnacksPickerBorder", { fg = P.border, bg = P.bg_alt })
  hl("SnacksPickerTitle", { fg = P.func, bg = P.bg_alt, bold = true })
  hl("SnacksPickerListCursorLine", { bg = P.bg_sel })
  hl("SnacksPickerPreviewTitle", { fg = P.type, bg = P.bg_alt, bold = true })
  hl("SnacksIndent", { fg = P.dim })
  hl("SnacksIndentScope", { fg = P.comment })
  hl("SnacksNotifierInfo", { fg = P.info })
  hl("SnacksNotifierWarn", { fg = P.warn })
  hl("SnacksNotifierError", { fg = P.error })
  hl("SnacksNotifierDebug", { fg = P.comment })
  hl("SnacksDashboardHeader", { fg = P.func })
  hl("SnacksDashboardIcon", { fg = P.type })
  hl("SnacksDashboardDesc", { fg = P.fg })
  hl("SnacksDashboardKey", { fg = P.focus })

  -----------------------------------------------------------------------------
  -- 6. blink.cmp (completion popup)
  -----------------------------------------------------------------------------
  link("BlinkCmpMenu", "Pmenu")
  link("BlinkCmpMenuSelection", "PmenuSel")
  hl("BlinkCmpMenuBorder", { fg = P.border, bg = P.bg_alt })
  hl("BlinkCmpLabelMatch", { fg = P.focus, bold = true })
  hl("BlinkCmpLabelDeprecated", { fg = P.dim, strikethrough = true })
  hl("BlinkCmpKind", { fg = P.type })
  hl("BlinkCmpDoc", { fg = P.fg, bg = P.bg_alt })
  hl("BlinkCmpDocBorder", { fg = P.border, bg = P.bg_alt })
  hl("BlinkCmpSignatureHelpActiveParameter", { fg = P.focus, bold = true })

  -----------------------------------------------------------------------------
  -- 7. treesitter-context, aerial, trouble, which-key
  -----------------------------------------------------------------------------
  hl("TreesitterContext", { bg = P.bg_hi })
  hl("TreesitterContextLineNumber", { fg = P.linenr, bg = P.bg_hi })
  hl("TreesitterContextBottom", { underline = true, sp = P.border })

  hl("AerialLine", { bg = P.bg_sel, bold = true })
  hl("AerialGuide", { fg = P.border })
  link("AerialFunction", "Function")
  link("AerialStruct", "Type")
  link("AerialField", "@variable.member")

  hl("TroubleText", { fg = P.fg })
  hl("TroubleCount", { fg = P.focus, bold = true })
  hl("TroubleNormal", { fg = P.fg, bg = P.bg_alt })

  hl("WhichKey", { fg = P.func })
  hl("WhichKeyGroup", { fg = P.type })
  hl("WhichKeyDesc", { fg = P.fg })
  hl("WhichKeySeparator", { fg = P.linenr })
  hl("WhichKeyBorder", { fg = P.border, bg = P.bg_alt })

  -----------------------------------------------------------------------------
  -- 8. nvim-dap (debugger)
  -----------------------------------------------------------------------------
  hl("DapBreakpoint", { fg = P.error })
  hl("DapBreakpointCondition", { fg = P.warn })
  hl("DapLogPoint", { fg = P.func })
  hl("DapStopped", { fg = P.ok })
  hl("DapStoppedLine", { bg = P.diff_add })
  hl("DapUIVariable", { fg = P.fg })
  hl("DapUIValue", { fg = P.string })
  hl("DapUIType", { fg = P.type })
  hl("DapUIScope", { fg = P.func, bold = true })
  hl("DapUIFrameName", { fg = P.fg })
  hl("DapUIThread", { fg = P.ok })
  hl("DapUIStoppedThread", { fg = P.focus })
  hl("DapUIBreakpointsPath", { fg = P.muted })
  hl("DapUIBreakpointsCurrentLine", { fg = P.ok, bold = true })
  hl("DapUIDecoration", { fg = P.border })
  hl("DapUILineNumber", { fg = P.linenr })

  -----------------------------------------------------------------------------
  -- 9. diffview
  -- Both the file panel and the diff body follow the Diff* values in the Vim file.
  -----------------------------------------------------------------------------
  hl("DiffviewFilePanelTitle", { fg = P.func, bold = true })
  hl("DiffviewFilePanelCounter", { fg = P.focus, bold = true })
  hl("DiffviewFilePanelFileName", { fg = P.fg })
  hl("DiffviewFilePanelPath", { fg = P.muted })
  hl("DiffviewFilePanelInsertions", { fg = P.ok })
  hl("DiffviewFilePanelDeletions", { fg = P.error })
  hl("DiffviewNormal", { fg = P.fg, bg = P.bg })
  hl("DiffviewDim1", { fg = P.dim })
  hl("DiffviewStatusModified", { fg = P.info })
  hl("DiffviewStatusAdded", { fg = P.ok })
  hl("DiffviewStatusDeleted", { fg = P.error })
  hl("DiffviewStatusUntracked", { fg = P.comment })

  -----------------------------------------------------------------------------
  -- 10. flash, grug-far
  -----------------------------------------------------------------------------
  hl("FlashLabel", { fg = P.bg, bg = P.focus, bold = true })
  hl("FlashMatch", { fg = P.fg, bg = P.bg_sel })
  hl("FlashCurrent", { fg = P.bg, bg = P.func, bold = true })
  hl("FlashBackdrop", { fg = P.dim })

  hl("GrugFarResultsMatch", { fg = P.bg, bg = P.string, bold = true })
  hl("GrugFarResultsPath", { fg = P.type, bold = true })
  hl("GrugFarResultsLineNr", { fg = P.linenr })
  hl("GrugFarInputLabel", { fg = P.func, bold = true })
end

return M
