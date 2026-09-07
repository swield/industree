---@class industree.Colors
---@field ansi string[] the 16 terminal colors, 1-indexed
---@field bg string Normal background
---@field fg string Normal foreground
---@field cursor string
---@field cursor_fg string
---@field sel string Visual background
---@field accent string Function
---@field accent_alt string Type
---@field label string Statement
---@field match string IncSearch background
---@field search string Search background
---@field comment string
---@field border string WinSeparator
---@field status_fg string
---@field status_bg string
---@field status_nc_fg string
---@field status_nc_bg string
---@field warn string
---@field tab_fg string TabLine
---@field tab_bg string
---@field tab_sel_fg string TabLineSel
---@field tab_sel_bg string
---@field tab_fill string TabLineFill background
---@field upstream string url of the file being generated

local M = {}

local UPSTREAM = "https://github.com/swield/industree/raw/main/extras"

M.targets = {
  alacritty = "alacritty/industree.toml",
  ghostty = "ghostty/industree",
  gnome_terminal = "gnome_terminal/industree.dconf",
  kitty = "kitty/industree.conf",
  konsole = "konsole/industree.colorscheme",
  windows_terminal = "windows_terminal/industree.json",
  xresources = "xresources/industree.Xresources",
  foot = "foot/industree.ini",
  wezterm = "wezterm/industree.toml",
  fzf = "fzf/industree.sh",
  tmux = "tmux/industree.tmux",
}

-- Reads the applied highlights rather than a second palette table, so a
-- generated file cannot disagree with what the color scheme renders.
---@return industree.Colors
local function colors()
  local ansi = vim.g.terminal_ansi_colors
  if type(ansi) ~= "table" or #ansi ~= 16 then
    error("industree is not the active color scheme")
  end
  local function hl(group, key)
    local spec = vim.api.nvim_get_hl(0, { name = group, link = false })
    return spec[key] and string.format("#%06x", spec[key]) or nil
  end
  return {
    ansi = ansi,
    bg = hl("Normal", "bg"),
    fg = hl("Normal", "fg"),
    cursor = hl("Cursor", "bg"),
    cursor_fg = hl("Cursor", "fg"),
    sel = hl("Visual", "bg"),
    accent = hl("Function", "fg"),
    accent_alt = hl("Type", "fg"),
    label = hl("Statement", "fg"),
    match = hl("IncSearch", "bg"),
    search = hl("Search", "bg"),
    comment = hl("Comment", "fg"),
    border = hl("WinSeparator", "fg"),
    status_fg = hl("StatusLine", "fg"),
    status_bg = hl("StatusLine", "bg"),
    status_nc_fg = hl("StatusLineNC", "fg"),
    status_nc_bg = hl("StatusLineNC", "bg"),
    warn = hl("WarningMsg", "fg"),
    tab_fg = hl("TabLine", "fg"),
    tab_bg = hl("TabLine", "bg"),
    tab_sel_fg = hl("TabLineSel", "fg"),
    tab_sel_bg = hl("TabLineSel", "bg"),
    tab_fill = hl("TabLineFill", "bg"),
  }
end

-- "#0e1b21" -> 14, 27, 33
---@param hex string
---@return integer, integer, integer
function M.rgb(hex)
  local h = hex:gsub("^#", "")
  return tonumber(h:sub(1, 2), 16), tonumber(h:sub(3, 4), 16), tonumber(h:sub(5, 6), 16)
end

-- $1 output directory, "extras" when omitted
---@param dir? string
function M.write(dir)
  dir = dir or "extras"
  local c = colors()
  local names = vim.tbl_keys(M.targets)
  table.sort(names)
  for _, name in ipairs(names) do
    local path = dir .. "/" .. M.targets[name]
    c.upstream = UPSTREAM .. "/" .. M.targets[name]
    vim.fn.mkdir(vim.fn.fnamemodify(path, ":h"), "p")
    local out = assert(io.open(path, "w"))
    out:write(require("industree.extra." .. name).generate(c))
    out:close()
    print(path)
  end
end

return M
