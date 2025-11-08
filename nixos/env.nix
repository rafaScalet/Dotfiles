{ pkgs, ... }: {
  environment.variables = rec {
    # For some reason on NixOS 25.05 this is necessary for gnome applications
    # GSK_RENDERER = "opengl";

    # XDG base specification
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";

    DOTFILES_DIR = "$HOME/Dotfiles";
    SCRIPTS_DIR = "$DOTFILES_DIR/scripts";

    MANPAGER = "env BATMAN_IS_BEING_MANPAGER=yes batman --pager=less";
    MANROFFOPT = [ "-c" ];

    CDPATH = [ "$HOME/Projects" "$HOME" ];

    EDITOR = "nvim";
    VISUAL = "nvim";

    CARGO_HOME = "${XDG_DATA_HOME}/cargo";
    RUSTUP_HOME = "${XDG_DATA_HOME}/rustup";

    GOPATH = "${XDG_DATA_HOME}/go";
    GOBIN = "${GOPATH}/bin";

    # ATAC config, needs to be done via environment variables. LOL
    ATAC_KEY_BINDINGS = "${XDG_CONFIG_HOME}/atac-vim.toml";
    ATAC_THEME = "${XDG_CONFIG_HOME}/atac-theme.toml";

    # required for tools installed outside the Nix store to see the C library headers.
    # (e.g. arduino-language-server installed via mason.nvim)
    CPATH = "${pkgs.glibc.dev}/include";
    LIBRARY_PATH = "${pkgs.glibc}/lib";

    PATH = [
      "${XDG_BIN_HOME}"
      "${SCRIPTS_DIR}"
      "${CARGO_HOME}/bin"
      "${GOBIN}"
      "${XDG_DATA_HOME}/nvim/mason/bin"
    ];

    # xdg-ninja and antidot suggestions (clean up HOME folder)
    GNUPGHOME = "${XDG_DATA_HOME}/gnupg";

    NPM_CONFIG_INIT_MODULE = "${XDG_CONFIG_HOME}/npm/config/npm-init.js";
    NPM_CONFIG_CACHE = "${XDG_CACHE_HOME}/npm";

    GRADLE_USER_HOME = "${XDG_DATA_HOME}/gradle";

    HISTFILE = "${XDG_STATE_HOME}/bash/history";

    PYTHON_HISTORY = "${XDG_DATA_HOME}/python/history";

    NODE_REPL_HISTORY = "${XDG_STATE_HOME}/node_repl_history";

    DOCKER_CONFIG = "${XDG_CONFIG_HOME}/docker";

    USQL_HISTORY = "${XDG_DATA_HOME}/usql/history";

    ANDROID_USER_HOME = "${XDG_DATA_HOME}/android";
  };
}
