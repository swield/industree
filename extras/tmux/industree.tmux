# industree colors for tmux
# Upstream: https://github.com/swield/industree/raw/main/extras/tmux/industree.tmux

set -g mode-style "fg=#c8e7f7,bg=#004968"

set -g message-style "fg=#00ffd7,bg=#18252c,fill=#18252c"
set -g message-command-style "fg=#00ffd7,bg=#18252c,fill=#18252c"

set -g pane-border-style "fg=#2f3e46"
set -g pane-active-border-style "fg=#00ffd7"

set -g status-style "fg=#00ffd7,bg=#18252c"

setw -g window-status-style "fg=#7a98a7,bg=#132026"
setw -g window-status-current-style "fg=#00ffd7,bg=#18252c,bold"
setw -g window-status-activity-style "fg=#ffca00"

set -g copy-mode-match-style "fg=#0e1b21,bg=#caf3dd"
set -g copy-mode-current-match-style "fg=#0e1b21,bg=#dcede3"

set -g clock-mode-colour "#00ffd7"
