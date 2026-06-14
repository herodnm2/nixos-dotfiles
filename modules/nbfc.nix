{ pkgs, ... }:

{
  environment.etc."nbfc/nbfc.json".text = ''
    {
      "SelectedConfigId": "Acer Nitro AN515-57"
    }
  '';

  systemd.services.nbfc_service = {
    description = "NoteBook FanControl service";
    wantedBy = [ "multi-user.target" ];

    path = [ pkgs.kmod ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.nbfc-linux}/bin/nbfc_service --config-file /etc/nbfc/nbfc.json";
      Restart = "on-failure";
    };
  };
}
