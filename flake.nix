{
  description = "NixOS with Mango and msnap";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-gaming.url = "github:fufexan/nix-gaming";

    somewm.url = "github:trip-zip/somewm";

    nix-cachyos-kernel.url = "git+file:///etc/nixos/nix-cachyos-kernel";
    nur.url = "github:nix-community/NUR";

    mangowm = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nbfc-linux = {
      url = "github:nbfc-linux/nbfc-linux";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    msnap = {
      url = "github:xtheeq/msnap";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    prism-cracked = {
      url = "github:Diegiwg/PrismLauncher-Cracked";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      mangowm,
      msnap,
      prism-cracked,
      spicetify-nix,
      nix-cachyos-kernel,
      home-manager,
      ...
    }:
    {

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs spicetify-nix prism-cracked;
        };

        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.clevex = import ./home.nix;
          }

          mangowm.nixosModules.mango

          spicetify-nix.nixosModules.default

          {
            nixpkgs.overlays = [
              msnap.overlays.default
              nix-cachyos-kernel.overlays.pinned
              (final: prev: {
                mango = mangowm.packages.x86_64-linux.default;
              })
            ];

            programs.mango.enable = true;

            nix.settings = {
              trusted-users = [
                "root"
                "clevex"
              ];

              substituters = [
                "https://cache.nixos.org"
                "https://nix-gaming.cachix.org"
                "https://attic.xuyh0120.win/lantian"
              ];

              trusted-public-keys = [
                "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
                "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
              ];
            };
          }
        ];
      };
    };
}
