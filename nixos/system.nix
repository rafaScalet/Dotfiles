# This is the configuration.nix, the name system.nix is just to be beauty
{ pkgs, ... }: {
  imports = [ /etc/nixos/hardware-configuration.nix ];

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

  boot.loader.limine.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;

  networking.hostName = "nix-btw";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  hardware.graphics.enable = true;

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
  };

  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [ xterm ];
    xkb.layout = "br";
  };

  services.printing.enable = true;

  services.openssh.enable = true;

  services.fwupd.enable = true;

  services.nixos-cli = {
    enable = true;
    config = {
      config_location = "/home/scalet/Dotfiles";
      use_nvd = true;
      no_confirm = true;
      apply = {
        use_nom = true;
        ignore_dirty_tree = true;
        imply_impure_with_tag = true;
        use_git_commit_msg = true;
      };
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  virtualisation = {
    docker.enable = true;
    podman.enable = true;

    libvirtd.enable = true;
    kvmgt.enable = true;

    spiceUSBRedirection.enable = true;
  };

  programs = {
    bat.enable = true;
    fish.enable = true;
    git.enable = true;
    lazygit.enable = true;
    nix-ld.enable = true;
    starship.enable = true;
    tmux.enable = true;
    vivid.enable = true;
    thunderbird.enable = true;
    localsend.enable = true;
    virt-manager.enable = true;
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

  programs.spicetify = {
    enable = true;
    theme = pkgs.spicetify.themes.catppuccin;
    colorScheme = "mocha";
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs = {
    gamemode.enable = true;
    gamescope.enable = true;
  };

  environment.systemPackages = with pkgs; [
    adwsteamgtk
    arduino-cli
    atac
    atuin
    bat-extras.batman
    bibata-cursors
    bottom
    brave
    cacert
    carapace
    carapace-bridge
    catppuccin-papirus-folders
    chafa
    clang
    collision
    delta
    dysk
    emojify
    eza
    fastfetch
    fd
    fragments
    fzf
    gcc
    gdu
    gh
    ghostty
    glab
    glibc
    glow
    gnome-boxes
    httpie
    hyperfine
    jstest-gtk
    kitty
    lazydocker
    lima
    lutris
    magnetic-catppuccin-gtk
    mise
    mission-center
    goose-cli
    mkcert
    newsflash
    nix-health
    nix-output-monitor
    nix-search-tv
    nix-your-shell
    nur.repos.grafcube.antidot
    nushell
    nvd
    obsidian
    onlyoffice-desktopeditors
    openapi-tui
    opencode
    ouch
    pgcli
    pinta
    pitivi
    tree-sitter
    planify
    poppler-utils
    protonplus
    ripgrep
    ripgrep-all
    rustup
    television
    tlrc
    tokei
    topgrade
    trash-cli
    treefmt
    unzip
    usql
    wget
    wl-clipboard
    xdg-ninja
    xdg-utils
    zip
  ];

  system.stateVersion = "24.11";
}
