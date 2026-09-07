local M = {}

---@param c industree.Colors
---@return string
function M.generate(c)
  local function bare(hex)
    return (hex:gsub("^#", ""))
  end
  local lines = {
    "# industree colors for foot",
    "# Upstream: " .. c.upstream,
    "",
    "[cursor]",
    "color=" .. bare(c.cursor_fg) .. " " .. bare(c.cursor),
    "",
    "[colors]",
    "foreground=" .. bare(c.fg),
    "background=" .. bare(c.bg),
    "selection-foreground=" .. bare(c.fg),
    "selection-background=" .. bare(c.sel),
    "",
  }
  for i = 1, 8 do
    lines[#lines + 1] = string.format("regular%d=%s", i - 1, bare(c.ansi[i]))
  end
  lines[#lines + 1] = ""
  for i = 9, 16 do
    lines[#lines + 1] = string.format("bright%d=%s", i - 9, bare(c.ansi[i]))
  end
  lines[#lines + 1] = ""
  return table.concat(lines, "\n")
end

return M
