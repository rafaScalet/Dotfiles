{
  description = "My NixOS Setup";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    unstable.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-cli = {
      url = "github:nix-community/nixos-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix/release-25.05";

    spicetify.url = "github:Gerg-L/spicetify-nix";
  };
  outputs = { self, nixpkgs, unstable, home-manager, nur, catppuccin, nixos-cli
    , spicetify }:
    let
      system = "x86_64-linux";
      overlays = [
        nur.overlays.default
        (_: prev: { unstable = import unstable { inherit (prev) system; }; })
        (_: _: { spicetify = spicetify.legacyPackages.${system}; })
      ];
    in {
      nixosConfigurations.nix-btw = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos/system.nix
          ./nixos/gnome.nix
          ./nixos/env.nix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          nixos-cli.nixosModules.nixos-cli
          spicetify.nixosModules.spicetify
          {
            nixpkgs.overlays = overlays;

            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.scalet.imports =
              [ ./nixos/home.nix catppuccin.homeModules.catppuccin ];
          }
        ];
      };
    };
}
