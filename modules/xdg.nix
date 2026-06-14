{ pkgs, ... }:

{
  xdg.portal.enable = true;

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
  ];

  xdg.mime.defaultApplications = {
    "inode/directory" = "thunar.desktop";
    "x-scheme-handler/file" = "thunar.desktop";
  };
}
