{ pkgs, ... }:

{
  users.users.clevex = {
    isNormalUser = true;

    description = "clevex";

    extraGroups = [
      "wheel"
      "networkmanager"
    ];

    shell = pkgs.fish;
  };

}
