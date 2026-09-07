local M = {}

---@param c industree.Colors
---@return string
function M.generate(c)
  local lines = {
    "# industree colors for Ghostty",
    "# Upstream: " .. c.upstream,
    "",
  }
  for i = 1, 16 do
    lines[#lines + 1] = string.format("palette = %d=%s", i - 1, c.ansi[i])
  end
  vim.list_extend(lines, {
    "",
    "background = " .. c.bg,
    "foreground = " .. c.fg,
    "cursor-color = " .. c.cursor,
    "selection-background = " .. c.sel,
    "selection-foreground = " .. c.fg,
    "",
  })
  return table.concat(lines, "\n")
end

return M
