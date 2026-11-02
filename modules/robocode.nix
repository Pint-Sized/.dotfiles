{ pkgs, ... }:
{
  home.packages = [ (pkgs.callPackage ../pkgs/robocode.nix { jdk = pkgs.jdk; }) ];
}
