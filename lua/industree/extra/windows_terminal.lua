local M = {}

local NAMES = { "black", "red", "green", "yellow", "blue", "purple", "cyan", "white" }

---@param c industree.Colors
---@return string
function M.generate(c)
  local e = {
    background = c.bg,
    cursorColor = c.cursor,
    foreground = c.fg,
    name = "industree",
    selectionBackground = c.sel,
  }
  for i, n in ipairs(NAMES) do
    e[n] = c.ansi[i]
    e["bright" .. n:sub(1, 1):upper() .. n:sub(2)] = c.ansi[i + 8]
  end
  local keys = vim.tbl_keys(e)
  table.sort(keys)
  local lines = {}
  for _, k in ipairs(keys) do
    lines[#lines + 1] = string.format('    "%s": "%s"', k, e[k])
  end
  return table.concat({
    "// industree colors for Windows Terminal",
    "// Upstream: " .. c.upstream,
    "{",
    table.concat(lines, ",\n"),
    "}",
    "",
  }, "\n")
end

return M
