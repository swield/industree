local M = {}

---@param c industree.Colors
---@return string
function M.generate(c)
  local function style(fg, bg, extra)
    return string.format('"fg=%s,bg=%s%s"', fg, bg, extra or "")
  end
  return table.concat({
    "# industree colors for tmux",
    "# Upstream: " .. c.upstream,
    "",
    "set -g mode-style " .. style(c.fg, c.sel),
    "",
    -- Setting message-style drops the fill the tmux default carries.
    "set -g message-style " .. style(c.status_fg, c.status_bg, ",fill=" .. c.status_bg),
    "set -g message-command-style " .. style(c.status_fg, c.status_bg, ",fill=" .. c.status_bg),
    "",
    "set -g pane-border-style " .. string.format('"fg=%s"', c.border),
    "set -g pane-active-border-style " .. string.format('"fg=%s"', c.accent),
    "",
    "set -g status-style " .. style(c.status_fg, c.status_bg),
    "",
    "setw -g window-status-style " .. style(c.tab_fg, c.tab_bg),
    "setw -g window-status-current-style " .. style(c.tab_sel_fg, c.tab_sel_bg, ",bold"),
    "setw -g window-status-activity-style " .. string.format('"fg=%s"', c.warn),
    "",
    "set -g copy-mode-match-style " .. style(c.bg, c.search),
    "set -g copy-mode-current-match-style " .. style(c.bg, c.match),
    "",
    "set -g clock-mode-colour " .. string.format('"%s"', c.accent),
    "",
  }, "\n")
end

return M
