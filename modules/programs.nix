{ pkgs, ... }:

{
  programs.firefox.enable = true;

  programs.fish.enable = true;

  programs.nix-ld = {
    enable = true;

    libraries = with pkgs; [
      libx11
      stdenv.cc.cc.lib
      libGL
      libxkbcommon
      libxi
      libxcursor
      libxrandr
      libxinerama
    ];
  };
}
