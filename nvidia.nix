{ config, pkgs, ... }:

{
  #  Kernel
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  # Graphics (NixOS 24.05+ uses hardware.graphics)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  #  GPU Drivers
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  # NVIDIA Driver
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  #  PRIME Offload (AMD iGPU + NVIDIA dGPU)
  hardware.nvidia.prime = {
    offload = {
      enable = true;
      enableOffloadCmd = true;  # nvidia-offload helper
    };

    amdgpuBusId = "PCI:7:0:0";
    nvidiaBusId  = "PCI:1:0:0";
  };

  # Steam settings
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    steam-run
    vulkan-tools    # vulkaninfo
    nvtopPackages.full  # GPU monitor for both AMD and NVIDIA
  ];
}