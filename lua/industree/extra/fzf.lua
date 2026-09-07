local M = {}

---@param c industree.Colors
---@return string
function M.generate(c)
  local roles = {
    { "bg", c.bg },
    { "bg+", c.sel },
    { "border", c.border },
    { "fg", c.fg },
    { "fg+", c.fg },
    { "gutter", c.bg },
    { "header", c.comment },
    { "hl", c.match },
    { "hl+", c.match },
    { "info", c.comment },
    { "label", c.label },
    { "marker", c.accent_alt },
    { "pointer", c.accent },
    { "prompt", c.accent },
    { "query", c.fg },
    { "scrollbar", c.border },
    { "separator", c.border },
    { "spinner", c.accent_alt },
  }
  local lines = {
    "# industree colors for fzf",
    "# Upstream: " .. c.upstream,
    "",
    'export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \\',
  }
  for _, r in ipairs(roles) do
    lines[#lines + 1] = string.format("  --color=%s:%s \\", r[1], r[2])
  end
  lines[#lines + 1] = '"'
  lines[#lines + 1] = ""
  return table.concat(lines, "\n")
end

return M
