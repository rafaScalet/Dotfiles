{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    import-tree.url = "github:vic/import-tree";
  };

  outputs = { self, nixpkgs, systems, ... }@inputs:
    let
      inherit (nixpkgs) lib;

      eachSystem = f:
        lib.genAttrs (import systems) (system:
          f {
            inherit system;
            pkgs = nixpkgs.legacyPackages.${system};
          });

      eachHost = lib.genAttrs (builtins.attrNames
        (lib.filterAttrs (_n: v: v == "directory") (builtins.readDir ./hosts)));

    in {
      nixosConfigurations = eachHost (host:
        lib.nixosSystem {
          specialArgs = { inherit inputs self host; };
          modules =
            [ ./hosts/${host}/configuration.nix self.nixosModules.default ];
        });

      packages = eachSystem ({ pkgs, system }: {
        inherit (pkgs) hello;
        default = self.packages.${system}.hello;
      });

      nixosModules = {
        let-dev = inputs.import-tree ./modules;
        default = self.nixosModules.let-dev;
      };
    };
}
