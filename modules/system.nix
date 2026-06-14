{ pkgs, ... }:

{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    NVD_BACKEND = "direct";
    LIBVA_DRIVER_NAME = "nvidia";
  };

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    SUDO_EDITOR = "nvim";
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  powerManagement.cpuFreqGovernor = "performance";

  systemd.tmpfiles.rules = [
    "L+ /bin/true - - - - /run/current-system/sw/bin/true"
  ];

  systemd.services.disableTurboBoost = {
    description = "Disable Intel Turbo Boost";

    wantedBy = [ "multi-user.target" ];

    after = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };

    script = ''
      ${pkgs.coreutils}/bin/echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo
    '';
  };
}
