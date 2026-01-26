# This is the configuration.nix, the name system.nix is just to be beauty
{ pkgs, inputs, config, ... }: {
  imports = [ ./hardware-configuration.nix ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    use-xdg-base-directories = true;
    auto-optimise-store = true;
    trusted-users = [ "scalet" ];
  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

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
    extraGroups = [
      "audio"
      "disk"
      "docker"
      "inputs"
      "kvm"
      "libvirtd"
      "networkmanager"
      "video"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  boot = {
    loader.limine.enable = true;
    loader.efi.canTouchEfiVariables = true;
    plymouth.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.tuigreet}/bin/tuigreet \
            --asterisks \
            --remember \
            --window-padding 1 \
            --theme border=magenta;prompt=magenta;time=red;action=blue;button=yellow
            --remember-user-session \
            --time \
            --cmd ${pkgs.niri}/bin/niri-session
        '';
        user = "greeter";
      };
    };
  };

  networking = {
    hostName = "nix-btw";
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };

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

  console = { keyMap = "br-abnt2"; };

  fonts = {
    packages = with pkgs; [
      corefonts
      terminus_font
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

  services.upower.enable = true;

  services.gvfs.enable = true;

  services.openssh.enable = true;

  services.fwupd.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.power-profiles-daemon.enable = true;

  hardware.bluetooth.enable = true;

  virtualisation = {
    docker.enable = true;
    docker.extraPackages = with pkgs; [ docker-init ];
    podman.enable = true;

    libvirtd.enable = true;
    kvmgt.enable = true;

    spiceUSBRedirection.enable = true;

    virtualbox.host.enable = true;
  };

  qt = {
    enable = true;
    platformTheme = "gtk2";
  };

  programs = {
    mtr.enable = true;
    fish.enable = true;
    git.enable = true;
    lazygit.enable = true;
    nix-ld.enable = true;
    tmux.enable = true;
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
    icons.fallbackCursorThemes = [ "Bibata-Modern-Classic" ];
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
  };

  programs.starship = {
    enable = true;
    transientPrompt.enable = true;
  };

  programs.bash.blesh.enable = true;

  programs.vivid = {
    enable = true;
    theme = "catppuccin-mocha";
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

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };

  programs.steam = { enable = true; };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
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
    wget
    wl-clipboard
    cliphist
    wtype
    xdg-ninja
    xdg-utils
    zip
    nixd
    gnome-boxes
    inspector
    catppuccinifier-gui
    wiremix
    qutebrowser
    logseq
    nautilus
    homebank
    denaro
    lsd
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    nirius
  ];

  system.stateVersion = "24.11";
}
