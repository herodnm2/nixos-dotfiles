{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/boot.nix
    ./modules/locale.nix
    ./modules/networking.nix
    ./modules/nix.nix

    ./modules/nvidia.nix
    ./modules/bluetooth.nix
    ./modules/audio.nix
    ./modules/desktop.nix

    ./modules/services.nix
    ./modules/spicetify.nix
    ./modules/security.nix
    ./modules/system.nix
    ./modules/programs.nix
    ./modules/users.nix
    ./modules/packages.nix
    ./modules/gaming.nix
    ./modules/xdg.nix

    ./modules/nbfc.nix
  ];

  system.stateVersion = "25.11";
}
