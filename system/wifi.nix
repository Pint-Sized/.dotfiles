{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

{

  # ----------- WIFI ---------- # 
  networking.wireless = {
    enable = true;
    # networks.<"SSID">.psk = <"password">;
    networks.eir34764285.psk = "BfBC3fe7CV";
  };
}
