# GRUB bootloader configuration with custom splash theme.

{ config, pkgs, ... }:

{
  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Boot settings
  boot.loader.grub = {
    enable      = true;
    efiSupport  = true;
    device      = "nodev";
    useOSProber = true;  # Detects Windows and other OS entries
    #timeout    = 6;     # Seconds to wait before auto-booting (Added below (boot.loader.timeout = 6))
    default     = 0;     # 0 = first entry (usually NixOS)

    splashImage = /boot/grub/bg.png;  # Custom GRUB background
    fontSize    = 30;
  };

  boot.loader.timeout = 6;
}