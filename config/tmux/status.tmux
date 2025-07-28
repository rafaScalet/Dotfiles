# -*- mode: tmux; -*-
# vim: set filetype=tmux:

set -g popup-border-lines rounded
set -g popup-border-style "bg=default,fg=blue"

set -g message-style "bg=default,fg=blue"
set -g message-command-style "bg=default,fg=blue"

set -g menu-border-style "fg=blue"
set -g menu-selected-style "bg=blue,fg=black"

set -g mode-style "bg=blue,fg=black"

set -g pane-border-lines simple
set -g pane-border-style "fg=default"
set -g pane-active-border-style "fg=blue"

set -g status-left-length 100
set -g status-right-length 100
set -g status-style bold
set -g status-justify absolute-centre
set -g status-position top

set -g @if-prefix-bg "#{?client_prefix,#[bg=red],#[bg=green]}"
set -g @if-prefix-fg "#{?client_prefix,#[fg=red],#[fg=green]}"

set -g @theme "#(gsettings get org.gnome.desktop.interface color-scheme)"
set -g @is-dark "#{?#{==:#{E:@theme},'prefer-dark'},brightblack,brightwhite}"
set -g @is-light "#{?#{==:#{E:@theme},'prefer-dark'},brightwhite,black}"

set -g @red-index     "#[fg=red,bg=default]#[fg=black,bg=red]#I "
set -g @blue-index    "#[fg=blue,bg=default]#[fg=black,bg=blue]#I "
set -g @cyan-index    "#[fg=cyan,bg=default]#[fg=black,bg=cyan]#I "
set -g @green-index   "#[fg=green,bg=default]#[fg=black,bg=green]#I "
set -g @yellow-index  "#[fg=yellow,bg=default]#[fg=black,bg=yellow]#I "
set -g @magenta-index "#[fg=magenta,bg=default]#[fg=black,bg=magenta]#I "
set -g @default-index "#[fg=#{E:@is-dark},bg=default]#[fg=#{E:@is-light},bg=#{E:@is-dark}]#I"

set -g @separator "#[fg=#{E:@is-dark},bg=default]"

set -g @active_icon   "#{?window_active,  ,}"
set -g @last_icon     "#{?window_last_flag,  ,}"
set -g @bell_icon     "#{?window_bell_flag,  ,}"
set -g @zoomed_icon   "#{?window_zoomed_flag,  ,}"
set -g @marked_icon   "#{?window_marked_flag,  ,}"
set -g @activity_icon "#{?window_activity_flag,  ,}"

set -g @icons "#{E:@activity_icon}#{E:@marked_icon}#{E:@zoomed_icon}#{E:@bell_icon}"

set -g @window "#[bg=#{E:@is-dark},fg=default] #W#{E:@icons}"

set -g @prefix "#{E:@if-prefix-fg}#{E:@if-prefix-bg}#[fg=#{E:@is-dark}] "
set -g @session "#[bg=#{E:@is-dark},fg=default] #S#{E:@separator}"

set -g @calendar "#[fg=magenta,bg=default]#[bg=magenta,fg=#{E:@is-dark}] "
set -g @date "#[bg=#{E:@is-dark},fg=default] %a %d/%m %H:%M#{E:@separator}"

set -g status-left "#{E:@prefix}#{E:@session} "

set -g status-right " #{E:@calendar}#{E:@date}"

set -g window-status-format "#{?window_last_flag,#{E:@yellow-index},#{E:@default-index}}#{E:@window}#{E:@separator}"

set -g window-status-current-format "#{E:@blue-index}#{E:@window}#{E:@separator}"

