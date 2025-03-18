{ pkgs, ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
      };
    };
    spiceUSBRedirection.enable = true;
  };
  programs = {
    virt-manager.enable = true;
  };
  users.groups.libvirtd.members = [ "$userSettings.username" ];

  #microvm = {
  #hypervisor = "qemu";
  #vcpu = 6;
  #mem = 12288;
  #};
}
