# -*- mode: tmux; -*-
# vim: set filetype=tmux:

set -g status-left-length 100
set -g status-style bold
set -g status-justify centre

set @red-index     "#[fg=red,bg=default]#[fg=black,bg=red]#I "
set @blue-index    "#[fg=blue,bg=default]#[fg=black,bg=blue]#I "
set @cyan-index    "#[fg=cyan,bg=default]#[fg=black,bg=cyan]#I "
set @green-index   "#[fg=green,bg=default]#[fg=black,bg=green]#I "
set @yellow-index  "#[fg=yellow,bg=default]#[fg=black,bg=yellow]#I "
set @magenta-index "#[fg=magenta,bg=default]#[fg=black,bg=magenta]#I "

set @if-prefix-bg "#{?client_prefix,#[bg=red],#[bg=green]}"
set @if-prefix-fg "#{?client_prefix,#[fg=red],#[fg=green]}"

set @separator "#[fg=black,bg=default]"

set @active_icon   "#{?window_active,  ,}"
set @last_icon     "#{?window_last_flag,  ,}"
set @bell_icon     "#{?window_bell_flag,  ,}"
set @zoomed_icon   "#{?window_zoomed_flag,  ,}"
set @marked_icon   "#{?window_marked_flag,  ,}"
set @activity_icon "#{?window_activity_flag,  ,}"

set @icons "#{E:@activity_icon}#{E:@marked_icon}#{E:@zoomed_icon}#{E:@bell_icon}"

set @window "#[bg=black,fg=default] #W#{E:@icons}"

set @prefix "#{E:@if-prefix-fg}#{E:@if-prefix-bg}#[fg=black] "
set @session "#[bg=black,fg=default] #S#{E:@separator}"

set @calendar "#[fg=blue,bg=default]#[bg=blue,fg=black] "
set @date "#[bg=black,fg=default] %a %d/%m %H:%M#{E:@separator}"

set -g status-left "#{E:@prefix}#{E:@session}"

set -g status-right "#{E:@calendar}#{E:@date}"

set -g window-status-format "#{E:@yellow-index}#{E:@window}#{E:@separator}"

set -g window-status-current-format "#{E:@magenta-index}#{E:@window}#{E:@separator}"

