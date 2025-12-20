{
  description = "My NixOS Setup";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
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

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, ... }@inputs:
    let system = "x86_64-linux";
    in with inputs; {
      nixosConfigurations.nix-btw = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs system; };
        modules = [
          {
            nixpkgs = {
              config.allowUnfree = true;
              overlays = [
                nur.overlays.default
                (_: _: { spicetify = spicetify.legacyPackages.${system}; })
              ];
            };
          }
          ./nixos/system.nix
          ./nixos/gnome.nix
          ./nixos/env.nix
          ./nixos/games.nix
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          nixos-cli.nixosModules.nixos-cli
          spicetify.nixosModules.spicetify
          {
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
