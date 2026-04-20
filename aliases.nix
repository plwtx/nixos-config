# Bash shell aliases for common NixOS and dev workflows.

{ config, pkgs, ... }:

{
  programs.bash.shellAliases = {

    # Edit configuration.nix
    conf                = "../../etc/nixos/configuration.nix";
    lenix-conf          = "sudo nano ../../etc/nixos/configuration.nix";
    lenix-boot-conf     = "sudo nano ../../etc/nixos/boot.nix";
    lenix-accounts-conf = "sudo nano ../../etc/nixos/accounts.nix";
    lenix-network-conf  = "sudo nano ../../etc/nixos/network.nix";
    lenix-app-conf      = "sudo nano ../../etc/nixos/applications.nix"; 
    lenix-alias-conf    = "sudo nano ../../etc/nixos/aliases.nix";
    lenix-conf-nvim     = "sudo nvim ../../etc/nixos/configuration.nix";
    lenix-rebuild       = "sudo nixos-rebuild switch";
    
    # Clean the Nix store
    lenix-clean       = "sudo nix-collect-garbage && sudo nixos-rebuild switch";
    lenix-clean-all   = "sudo nix-collect-garbage -d && sudo nixos-rebuild switch";

    # YT Download:
    youtube-download-audio = ''yt-dlp -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s"'';
    youtube-download-playlist-audio = ''yt-dlp -x --audio-format mp3 --audio-quality 0 -o "%(playlist_index)s - %(title)s.%(ext)s"'';
    youtube-download-video = ''yt-dlp -f "bestvideo+bestaudio/best" --merge-output-format mp4 -o "%(title)s.%(ext)s"'';
    youtube-download-playlist = ''yt-dlp -f "bestvideo+bestaudio/best" --merge-output-format mp4 -o "%(playlist_index)s - %(title)s.%(ext)s"'';






    # Others    

    # NPM Commands (run inside a nix-shell)
    npm-run-dev       = "nix-shell --run \"npm run dev\"";
    npm-run-build     = "nix-shell --run \"npm run build\"";

    # Run app with NVIDIA GPU offload (PRIME)
    gpu-blender = "__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia blender";
    gpu         = "__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia";
  };
}
