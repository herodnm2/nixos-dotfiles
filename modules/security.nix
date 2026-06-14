{ pkgs, ... }:

{
  security.rtkit.enable = true;

  security.pam.loginLimits = [
    {
      domain = "@users";
      item = "rtprio";
      type = "-";
      value = "99";
    }

    {
      domain = "@users";
      item = "memlock";
      type = "-";
      value = "unlimited";
    }

    {
      domain = "@users";
      item = "nice";
      type = "-";
      value = "-20";
    }
  ];

  security.wrappers.wshowkeys = {
    owner = "root";
    group = "root";
    source = "${pkgs.wshowkeys}/bin/wshowkeys";
    setuid = true;
  };
}
