# industree

A dark color scheme for Vim and Neovim, with teal and green accents.

## Features

- Tree-sitter and LSP semantic highlighting
- Support for common file types and plugins
- Terminal colors

## Requirements

- Vim 8.0, or Neovim 0.10 for the tree-sitter and LSP colors
- `termguicolors` for the full palette

Neovim turns `termguicolors` on for you; in Vim it also needs `t_8f` and
`t_8b`.

## Installation

With [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
-- lua/plugins/industree.lua
return { "swield/industree", lazy = false, priority = 1000 }
```

With [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'swield/industree'
```

## Usage

```vim
colorscheme industree
```

With vim-plug, put that line after `plug#end()`. With LazyVim, set
`opts.colorscheme` instead.

## Configuration

```vim
let g:industree_italic_comment = 0   " comments are italic by default
let g:industree_no_termguicolors = 1 " skip the automatic termguicolors
```

Set either before you load the scheme. Turn the italics off if your font has
to synthesise the slant, which is usually the case for CJK.

## Supported Plugins

- [snacks.nvim](https://github.com/folke/snacks.nvim) (picker, indent, notifier, dashboard)
- [blink.cmp](https://github.com/saghen/blink.cmp)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
- [aerial.nvim](https://github.com/stevearc/aerial.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) and [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim)
- [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
- [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)

## Extras

The same palette outside the editor, so the shell, `ls`, fzf and tmux match
what vim and Neovim render.

| Tool | Extra |
|---|---|
| [Alacritty](https://github.com/alacritty/alacritty) | [extras/alacritty](extras/alacritty/industree.toml) |
| [foot](https://codeberg.org/dnkl/foot) | [extras/foot](extras/foot/industree.ini) |
| [fzf](https://github.com/junegunn/fzf) | [extras/fzf](extras/fzf/industree.sh) |
| [Ghostty](https://ghostty.org) | [extras/ghostty](extras/ghostty/industree) |
| [GNOME Terminal](https://wiki.gnome.org/Apps/Terminal) | [extras/gnome_terminal](extras/gnome_terminal/industree.dconf) |
| [kitty](https://sw.kovidgoyal.net/kitty/) | [extras/kitty](extras/kitty/industree.conf) |
| [Konsole](https://konsole.kde.org) | [extras/konsole](extras/konsole/industree.colorscheme) |
| [tmux](https://github.com/tmux/tmux) | [extras/tmux](extras/tmux/industree.tmux) |
| [WezTerm](https://wezterm.org) | [extras/wezterm](extras/wezterm/industree.toml) |
| [Windows Terminal](https://github.com/microsoft/terminal) | [extras/windows_terminal](extras/windows_terminal/industree.json) |
| [Xresources](https://wiki.archlinux.org/title/X_resources) | [extras/xresources](extras/xresources/industree.Xresources) |

The tmux file sets colors only. The status line layout, `status-left` and
`status-right` stay yours.

Generated from the applied highlights, so they cannot disagree with what the
color scheme renders. To rebuild after a palette change:

```vim
:lua require("industree.extra").write()
```

## Documentation

See [doc/industree.txt](doc/industree.txt), or `:help industree` once your
plugin manager has generated the help tags.

## License

MIT. See [LICENSE](LICENSE).
