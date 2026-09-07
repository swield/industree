local M = {}

---@param c industree.Colors
---@return string
function M.generate(c)
  local function rgb(hex)
    return string.format("rgb(%d, %d, %d)", require("industree.extra").rgb(hex))
  end
  local palette = {}
  for i = 1, 16 do
    palette[i] = "'" .. rgb(c.ansi[i]) .. "'"
  end
  return table.concat({
    "# industree colors for GNOME Terminal",
    "# <PROFILE_UUID> is the UUID of the profile this applies to.",
    "# Upstream: " .. c.upstream,
    "",
    "[:<PROFILE_UUID>]",
    "background-color='" .. rgb(c.bg) .. "'",
    "cursor-background-color='" .. rgb(c.cursor) .. "'",
    "cursor-colors-set=true",
    "cursor-foreground-color='" .. rgb(c.cursor_fg) .. "'",
    "foreground-color='" .. rgb(c.fg) .. "'",
    "highlight-background-color='" .. rgb(c.sel) .. "'",
    "highlight-colors-set=true",
    "highlight-foreground-color='" .. rgb(c.fg) .. "'",
    "palette=[" .. table.concat(palette, ", ") .. "]",
    "use-theme-colors=false",
    "visible-name='industree'",
    "",
  }, "\n")
end

return M
