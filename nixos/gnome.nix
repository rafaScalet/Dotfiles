# This config is for gnome 48 since my nix-os pkgs is bind to 25.05
{ pkgs, lib, ... }:
let
  extensions = [
    "alphabetical-app-grid"
    "blur-my-shell"
    "caffeine"
    "clipboard-indicator"
    "color-picker"
    "dash-to-dock"
    "just-perfection"
    "keep-pinned-apps-in-appgrid"
    "lock-keys"
    "paperwm"
    "unite"
    "search-light"
    "user-themes"
    "vitals"
  ];

  extension = "org/gnome/shell/extensions";
  desktop = "org/gnome/desktop";

  int = number: lib.gvariant.mkInt32 number;
  tuple = tuple: lib.gvariant.mkTuple tuple;
  double = double: lib.gvariant.mkDouble double;

  extensionsPkgs = builtins.map (name: pkgs.gnomeExtensions.${name}) extensions;
  extensionsUuid =
    builtins.map (name: pkgs.gnomeExtensions.${name}.extensionUuid) extensions;
in {
  programs.dconf.profiles.user.databases = [{
    lockAll = true;
    settings = {
      "org/gnome/shell" = {
        enabled-extensions = extensionsUuid;
        disable-user-extensions = false;
        favorite-apps = [
          "kitty.desktop"
          "brave-browser.desktop"
          "obsidian.desktop"
          "io.github.alainm23.planify.desktop"
          "spotify.desktop"
          "onlyoffice-desktopeditors.desktop"
          "org.gnome.Nautilus.desktop"
          "thunderbird.desktop"
          "net.lutris.Lutris.desktop"
        ];
      };
      "${desktop}/interface" = {
        icon-theme = "Papirus";
        cursor-theme = "Bibata-Modern-Classic";
        enable-hot-corners = false;
        gtk-theme = "Catppuccin-GTK-Dark";
        font-name = "JetBrainsMono Nerd Font 11";
        monospace-font-name = "JetBrainsMono Nerd Font 11";
        document-font-name = "JetBrainsMono Nerd Font 11";
        accent-color = "blue";
      };
      "${desktop}/background" = {
        picture-uri = "file:///home/scalet/Dotfiles/assets/background.png";
        picture-uri-dark = "file:///home/scalet/Dotfiles/assets/background.png";
      };
      "${desktop}/input-sources" = {
        sources = [ (tuple [ "xkb" "br" ]) (tuple [ "xkb" "us" ]) ];
      };
      "${extension}/user-theme".name = "Catppuccin-GTK-Dark";
      "${extension}/paperwm" = {
        show-window-position-bar = false;
        show-workspace-indicator = false;
        disable-topbar-styling = true;
        selection-border-size = int 0;
        default-focus-mode = int 1;
        window-gap = int 25;
      };
      "${extension}/unite" = {
        app-menu-ellipsize-mode = "end";
        enable-titlebar-actions = true;
        greyscale-tray-icons = false;
        hide-activities-button = "always";
        hide-app-menu-icon = true;
        hide-window-titlebars = "always";
        reduce-panel-spacing = false;
        show-appmenu-button = false;
        show-desktop-name = false;
        show-window-buttons = "always";
        show-window-title = "never";
        use-activities-text = false;
        window-buttons-placement = "last";
        window-buttons-theme = "catppuccin";
      };
      "${extension}/search-light" = {
        animation-speed = int 100;
        background-color = tuple [
          (double 0.11764705926179886)
          (double 0.11764705926179886)
          (double 0.18039216101169586)
          (double 0.52)
        ];
        border-radius = double 3.0;
        entry-font-size = int 1;
        monitor-count = int 2;
        popup-at-cursor-monitor = true;
        preferred-monitor = int 0;
        scale-height = double 0.1;
        scale-width = double 0.1;
        show-panel-icon = false;
        use-animations = true;
        window-effect-color = [
          (double 1.0)
          (double 0.996666669845581)
          (double 0.996666669845581)
          (double 1.0)
        ];
      };
      "${extension}/clipboard-indicator" = {
        clear-on-boot = false;
        disable-down-arrow = true;
        keep-selected-on-clear = true;
        move-item-first = true;
        notify-on-copy = true;
      };
      "${extension}/vitals" = {
        hot-sensors =
          [ "_memory_usage_" "_processor_usage_" "_temperature_processor_0_" ];
        icon-style = int 1;
        menu-centered = true;
        monitor-cmd = "missioncenter";
        battery-slot = int 1;
        use-higher-precision = true;
        update-time = int 1;
        position-in-panel = int 3;
        show-gpu = true;
        show-battery = true;
      };
      "${extension}/caffeine" = {
        enable-mpris = true;
        toggle-shortcut = [ "<Control>F1" ];
        user-enabled = false;
      };
      "${extension}/just-perfection" = {
        activities-button = false;
        background-menu = false;
        calendar = true;
        clock-menu = true;
        dash-separator = false;
        events-button = true;
        panel = true;
        search = false;
        window-preview-caption = false;
        weather = false;
        workspace = false;
        workspace-popup = false;
        workspace-wrap-around = false;
        workspaces-in-app-grid = false;
        world-clock = false;
        startup-status = int 0;
      };
      "${extension}/blur-my-shell/panel".blur = false;
      "${extension}/blur-my-shell/dash-to-dock".blur = false;
    };
  }];

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    evince
    geary
    gnome-console
    gnome-logs
    gnome-system-monitor
    gnome-tour
    yelp
  ];

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.gnome.sushi.enable = true;

  environment.systemPackages = extensionsPkgs;
}
