{ pkgs, ... }:

{
  imports = [
    ./home/programs/alacritty.nix
    ./home/programs/fish.nix
    ./home/programs/starship.nix
  ];
  home.username = "clevex";

  home.homeDirectory = "/home/clevex";

  home.stateVersion = "25.11";

  xdg.enable = true;

  programs.home-manager.enable = true;

  home.packages = with pkgs; [

    fastfetch
    btop
    cava
    micro
    neovim

    nixd
    statix
    deadnix
    nixfmt-rfc-style
    nh
    nix-output-monitor

    rofi
    swaybg
    swaynotificationcenter
    wl-clipboard
    brightnessctl
    pavucontrol
    pamixer
    nwg-look
    matugen
    pywal
    pywalfox-native

    discord
    equibop
    materialgram
    obs-studio
    celluloid
    thunar
    easyeffects
    blueman
    cool-retro-term

    gcc
    go
    cargo
    nodejs
    clang-tools
    python3Packages.pip
    uv
    ripgrep
    fd
    fzf
    lazygit
    sqlite
    luarocks

    imagemagick
    ghostscript
    tectonic
    libnotify
    jq

    gamemode

    chromium

    android-tools

    fish
    starship
    alacritty
    waybar

    awww
  ];

  programs.git = {
    enable = true;

    userName = "herodnm2";

    userEmail = "223722111+herodnm2@users.noreply.github.com";
  };

  programs.fish = {
    enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos";
      update = "nix flake update /etc/nixos";
      gc = "nix-collect-garbage -d";
    };
  };

  programs.fastfetch.enable = true;
  module.starship.enable = true;
  programs.alacritty.enable = true;
  programs.waybar.enable = true;
}
