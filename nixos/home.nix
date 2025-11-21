{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/Dotfiles";

  dotfilesConfig = "${dotfiles}/config";
  dotfileDockerCompose = "${dotfiles}/docker/compose";

  createSymlink = path: config.lib.file.mkOutOfStoreSymlink path;

  hiddenApps =
    [ "bottom" "fish" "nixos-manual" "nvim" "scrcpy" "scrcpy-console" "yazi" ];

  configs = builtins.attrNames (builtins.readDir dotfilesConfig);
  dockerComposes = builtins.attrNames (builtins.readDir dotfileDockerCompose);
in {
  home.username = "scalet";
  home.homeDirectory = "/home/scalet";

  xdg.configFile = builtins.listToAttrs (map (name: {
    inherit name;
    value = {
      source = createSymlink "${dotfilesConfig}/${name}";
      recursive = true;
    };
  }) configs) // { };

  xdg.desktopEntries = builtins.listToAttrs (map (name: {
    inherit name;
    value = {
      inherit name;
      noDisplay = true;
    };
  }) hiddenApps) // { };

  home.file = builtins.listToAttrs (map (name: {
    name = "Docker/${name}";
    value = {
      source = createSymlink "${dotfileDockerCompose}/${name}";
      recursive = true;
    };
  }) dockerComposes);

  home.stateVersion = "25.05";
}
