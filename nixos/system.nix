# This is the configuration.nix, the name system.nix is just to be beauty
{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    use-xdg-base-directories = true;
    auto-optimise-store = true;
    trusted-users = [ "scalet" ];
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };

  catppuccin = {
    accent = "blue";
    flavor = "mocha";
    tty.enable = true;
    limine.enable = true;
    plymouth.enable = true;
  };

  users.users.scalet = {
    isNormalUser = true;
    description = "Rafael Scalet de Lima";
    extraGroups =
      [ "wheel" "docker" "networkmanager" "kvm" "inputs" "libvirtd" ];
    shell = pkgs.fish;
  };

  boot = {
    loader.limine.enable = true;
    loader.efi.canTouchEfiVariables = true;
    plymouth.enable = true;
  };

  networking = {
    hostName = "nix-btw";
    networkmanager.enable = true;
    nftables.enable = true;

    firewall = {
      enable = true;
      # allowedTCPPorts = [ ];
    };
  };

  time.timeZone = "America/Sao_Paulo";

  i18n = {
    defaultLocale = "pt_BR.UTF-8";
    extraLocales = [ "en_US.UTF-8/UTF-8" "pt_BR.UTF-8/UTF-8" ];
  };

  console.keyMap = "br-abnt2";

  fonts = {
    packages = with pkgs; [
      corefonts
      material-design-icons
      nerd-fonts.symbols-only
      nerd-fonts.jetbrains-mono
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "JetBrainsMono Nerd Font" ];
        sansSerif = [ "JetBrainsMono Nerd Font" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
    };
    fontDir.enable = true;
    enableDefaultPackages = true;
  };

  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [ xterm ];
    xkb.layout = "br";
  };

  services.printing.enable = true;

  services.gvfs.enable = true;

  services.openssh.enable = true;

  services.fwupd.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  virtualisation = {
    docker.enable = true;
    docker.extraPackages = with pkgs; [ docker-init ];
    podman.enable = true;

    libvirtd.enable = true;
    kvmgt.enable = true;

    spiceUSBRedirection.enable = true;
  };

  programs = {
    mtr.enable = true;
    fish.enable = true;
    git.enable = true;
    lazygit.enable = true;
    nix-ld.enable = true;
    tmux.enable = true;
    vivid.enable = true;
    thunderbird.enable = true;
    localsend.enable = true;
    virt-manager.enable = true;
    trippy.enable = true;
    zoxide.enable = true;
    yazi.enable = true;
    television.enable = true;
    niri.enable = true;
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.nh = {
    enable = true;
    flake = "/home/scalet/Dotfiles";
  };

  programs.nix-index = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [ batman ];
  };

  programs.spicetify = {
    enable = true;
    theme = pkgs.spicetify.themes.catppuccin;
    colorScheme = "mocha";
  };

  environment.systemPackages = with pkgs; [
    atuin
    xwayland-satellite
    bibata-cursors
    bottom
    brave
    cachix
    catppuccin-papirus-folders
    catppuccin-whiskers
    chafa
    cht-sh
    delta
    doggo
    dprint
    dtool
    dysk
    emojify
    eza
    fastfetch
    fd
    fragments
    fuzzel
    fzf
    gcc
    gdu
    gh
    glibc
    swaybg
    glow
    qs
    goose-cli
    httpie
    hyperfine
    jwt-cli
    kitty
    lazydocker
    magnetic-catppuccin-gtk
    mise
    mission-center
    nix-search-tv
    brightnessctl
    nix-your-shell
    nushell
    obsidian
    onlyoffice-desktopeditors
    ouch
    pinta
    planify
    poppler-utils
    rar
    ripgrep
    ripgrep-all
    rustup
    scrcpy
    starship
    television
    tlrc
    tokei
    topgrade
    trash-cli
    tree-sitter
    treefmt
    units
    unzip
    usql
    vscodium
    wget
    wl-clipboard
    xdg-ninja
    xdg-utils
    zip
  ];

  system.stateVersion = "24.11";
}
