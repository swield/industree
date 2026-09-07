local M = {}

local NAMES = { "black", "red", "green", "yellow", "blue", "magenta", "cyan", "white" }

---@param c industree.Colors
---@return string
function M.generate(c)
  local function section(name, pairs_)
    local out = { "[colors." .. name .. "]" }
    for _, p in ipairs(pairs_) do
      out[#out + 1] = string.format("%s = '%s'", p[1], p[2])
    end
    return table.concat(out, "\n")
  end
  local function ansi(offset)
    local out = {}
    for i, n in ipairs(NAMES) do
      out[i] = { n, c.ansi[i + offset] }
    end
    return out
  end
  return table.concat({
    "# industree Alacritty colors",
    "# Upstream: " .. c.upstream,
    "",
    "# Default colors",
    section("primary", { { "background", c.bg }, { "foreground", c.fg } }),
    "",
    "# Cursor",
    section("cursor", { { "text", c.cursor_fg }, { "cursor", c.cursor } }),
    "",
    "# Selection",
    section("selection", { { "background", c.sel }, { "text", "CellForeground" } }),
    "",
    "# Normal colors",
    section("normal", ansi(0)),
    "",
    "# Bright colors",
    section("bright", ansi(8)),
    "",
  }, "\n")
end

return M
