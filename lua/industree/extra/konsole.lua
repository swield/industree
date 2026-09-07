local M = {}

---@param c industree.Colors
---@return string
function M.generate(c)
  local function triple(hex)
    return string.format("%d,%d,%d", require("industree.extra").rgb(hex))
  end
  local lines = {
    "# industree colors for Konsole",
    "# Upstream: " .. c.upstream,
    "",
    "[Background]",
    "Color=" .. triple(c.bg),
    "",
    "[BackgroundIntense]",
    "Color=" .. triple(c.sel),
    "",
    "[Foreground]",
    "Color=" .. triple(c.fg),
    "",
    "[ForegroundIntense]",
    "Bold=true",
    "Color=" .. triple(c.fg),
  }
  for i = 1, 8 do
    vim.list_extend(lines, {
      "",
      string.format("[Color%d]", i - 1),
      "Color=" .. triple(c.ansi[i]),
      "",
      string.format("[Color%dIntense]", i - 1),
      "Color=" .. triple(c.ansi[i + 8]),
    })
  end
  vim.list_extend(lines, {
    "",
    "[General]",
    "Description=industree",
    "Opacity=1",
    "",
  })
  return table.concat(lines, "\n")
end

return M
