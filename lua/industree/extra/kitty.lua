local M = {}

---@param c industree.Colors
---@return string
function M.generate(c)
  local lines = {
    "# vim:ft=kitty",
    "",
    "## name: industree",
    "## license: MIT",
    "## author: swield",
    "## upstream: " .. c.upstream,
    "",
    "background " .. c.bg,
    "foreground " .. c.fg,
    "cursor " .. c.cursor,
    "cursor_text_color " .. c.cursor_fg,
    "selection_background " .. c.sel,
    "selection_foreground " .. c.fg,
    "",
    "# tabs",
    "active_tab_foreground " .. c.tab_sel_fg,
    "active_tab_background " .. c.tab_sel_bg,
    "active_tab_font_style bold",
    "inactive_tab_foreground " .. c.tab_fg,
    "inactive_tab_background " .. c.tab_bg,
    "tab_bar_background " .. c.tab_fill,
    "",
    "# normal",
  }
  for i = 1, 8 do
    lines[#lines + 1] = string.format("color%d %s", i - 1, c.ansi[i])
  end
  lines[#lines + 1] = ""
  lines[#lines + 1] = "# bright"
  for i = 9, 16 do
    lines[#lines + 1] = string.format("color%d %s", i - 1, c.ansi[i])
  end
  lines[#lines + 1] = ""
  return table.concat(lines, "\n")
end

return M
