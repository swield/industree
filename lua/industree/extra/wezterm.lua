local M = {}

---@param c industree.Colors
---@return string
function M.generate(c)
  local function list(from)
    local out = {}
    for i = from, from + 7 do
      out[#out + 1] = string.format('"%s"', c.ansi[i])
    end
    return "[" .. table.concat(out, ", ") .. "]"
  end
  return table.concat({
    "# industree colors for WezTerm",
    "# Upstream: " .. c.upstream,
    "",
    "[colors]",
    'foreground = "' .. c.fg .. '"',
    'background = "' .. c.bg .. '"',
    'cursor_bg = "' .. c.cursor .. '"',
    'cursor_border = "' .. c.cursor .. '"',
    'cursor_fg = "' .. c.cursor_fg .. '"',
    'selection_bg = "' .. c.sel .. '"',
    'selection_fg = "' .. c.fg .. '"',
    "",
    'split = "' .. c.border .. '"',
    'scrollbar_thumb = "' .. c.border .. '"',
    "",
    "ansi = " .. list(1),
    "brights = " .. list(9),
    "",
    "[metadata]",
    "aliases = []",
    'author = "swield"',
    'name = "industree"',
    "",
  }, "\n")
end

return M
