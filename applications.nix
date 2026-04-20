# System packages, Firefox, GNOME exclusions, and fonts.

{ config, pkgs, ... }:

{
  # Install firefox via the programs helper (preferred over systemPackages).
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim       # Modern VIM
    wget         # Command line tool for downloading files from web.
    google-chrome # Google Chrome (Switched to Floorp / Firefox)
    git          # Git
    gh           # GitHub client
    vscode       # Code editor
    #cudaPackages.cudatoolkit # DOESN'T WORK PROPERLY (awaiting fix)
    ghostty      # Go to terminal
    atomix        # The only game I have :D
    thunderbird  # Most decent and stable mail client.
    anki         # Spaced repetition tool (Using for language learning).
    gnome-tweaks # Gnome configuration tool.
    obsidian     # Len's favorite markdown editor.
    planify      # Task manager (I started using Obsidian as my main task manager).
    pureref      # Reference board manager.
    filezilla    # An FTP Client.
    vivaldi      # Browser.
    yt-dlp       # YouTube Downloader.
    #floorp      # Firefox Based Browser.
    htop         # Resource Monitor.
    hyfetch      # Better neofetch :3
    #remmina     # RDP Client.
    #nomachine-client # not-FOSS RDP client.
    #mullvad     # Len's VPN choice.
    #mullvad-browser # Mullvad Browser (testing)
    #libimobiledevice # Data transfer between IOS and Linux.
    #ifuse       # For IOS data connection.
    #insomnia    # Open-Source API client.
    #prismlauncher # Better Minecraft launcher.
    anydesk
    pixieditor   # 2.0 / FOSS 2D Image Editor / As of 12.11.2025 not working.
    nodejs_24    # New version of node Jan2026.
    pngquant     # Tool to convert 24/32-bit RGBA PNGs to 8-bit palette with alpha channel preserved
    jpegoptim    # pngquant alternative for jpg format.
    vesktop      # Better discord.
    libheif      # HEIF image format decoder / encoder.
    figma-linux  # Electron version of Figma.
    tree         # Recursive directory listing command.    
    amberol      # GUI Music player.
    eartag       # Yes I need to edit tags as well.


    # Shortcut for running app with GPU (ex: gpu google-chrome-stable):
    #(writeShellScriptBin "gpu" ''
    #   export __NV_PRIME_RENDER_OFFLOAD=1
    #   export __GLX_VENDOR_LIBRARY_NAME=nvidia
    #   exec "$@"
    #'')
  ];

  # Excluded Packages (GNOME)
  environment.gnome.excludePackages = (with pkgs; [
    geary
  ]);

  # Fonts (for Japanese character fix)
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      fira-code
      liberation_ttf
      ubuntu-classic
    ];

    fontconfig = {
      defaultFonts = {
        serif     = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "Ubuntu Mono" ];
      };
    };
  };
}
