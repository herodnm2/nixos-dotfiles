{ pkgs, inputs, ... }:

{

  environment.systemPackages = with pkgs; [

    (python313.withPackages (
      ps: with ps; [
        tkinter
      ]
    ))

    git
    wget
    curl
    unzip
    zip

    nerd-fonts.jetbrains-mono
    papirus-icon-theme
    colloid-icon-theme

    libGL
    libx11
    libxkbcommon
    libxi
    libxcursor
    libxrandr
    libxinerama
    libva
    stdenv.cc.cc.lib

    pkgs.nbfc-linux
    alsa-utils
    bluez
    linuxPackages.cpupower
    vulkan-tools
    mesa-demos

    nerd-fonts.jetbrains-mono
    font-awesome

    os-prober
    bubblewrap
    gsettings-desktop-schemas
    glib

    kdePackages.extra-cmake-modules
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum

    msnap
    #prism-cracked.packages.${pkgs.system}.default

    spotify
    spicetify-cli
  ];
  services.displayManager.sessionPackages = [
    inputs.somewm.packages.${pkgs.system}.somewm
  ];
}
