{
  boot.loader.grub.device = "/dev/sda";
  fileSystems."/".device = "/dev/sda1";
  services.sshd.enable = true;
}

