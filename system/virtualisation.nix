{
  pkgs,
  userSettings,
  ...
}: {
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        vhostUserPackages = with pkgs; [
          virtiofsd
        ];
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection.enable = true;
  };
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["${userSettings.username}"];
}
