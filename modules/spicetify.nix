{ pkgs, spicetify-nix, ... }:

{
  programs.spicetify = {
    enable = true;

    enabledCustomApps =
      with spicetify-nix.legacyPackages.${pkgs.system}.apps;
      [
        marketplace
      ];
  };
}
