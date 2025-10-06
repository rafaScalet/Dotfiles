{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/Dotfiles";

  dotfilesConfig = "${dotfiles}/config";

  createSymlink = path: config.lib.file.mkOutOfStoreSymlink path;

  hiddenApps = [ "bottom" "fish" "nixos-manual" "nvim" ];

  configs = builtins.attrNames (builtins.readDir dotfilesConfig);
in {
  home.username = "scalet";
  home.homeDirectory = "/home/scalet";

  programs.gh = {
    enable = true;
    extensions = with pkgs; [ gh-dash gh-markdown-preview gh-i gh-f gh-s ];
  };

  xdg.configFile = builtins.listToAttrs (map (name: {
    name = name;
    value = {
      source = createSymlink "${dotfilesConfig}/${name}";
      recursive = true;
    };
  }) configs) // { };

  xdg.desktopEntries = builtins.listToAttrs (map (name: {
    name = name;
    value = {
      name = "";
      noDisplay = true;
    };
  }) hiddenApps) // { };

  home.stateVersion = "25.05";
}
