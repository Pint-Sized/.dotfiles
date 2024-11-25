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
    networks.Gwayyy.psk = "0512Fionn";
    networks.eir32857982.psk = "WQtAK7D9qF";
  };
}
