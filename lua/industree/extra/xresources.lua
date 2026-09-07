local M = {}

---@param c industree.Colors
---@return string
function M.generate(c)
  local lines = {
    "! industree colors for Xresources",
    "! Upstream: " .. c.upstream,
    "",
    "*background: " .. c.bg,
    "*foreground: " .. c.fg,
    "*cursorColor: " .. c.cursor,
    "",
  }
  for i = 1, 16 do
    lines[#lines + 1] = string.format("*color%d: %s", i - 1, c.ansi[i])
    if i == 8 then
      lines[#lines + 1] = ""
    end
  end
  lines[#lines + 1] = ""
  return table.concat(lines, "\n")
end

return M
