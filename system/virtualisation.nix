{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ distrobox ];

  programs.virt-manager.enable = true;

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };

    podman = {
      enable = true;
    };

    docker.enable = true;

    spiceUSBRedirection.enable = true;
  };
}
