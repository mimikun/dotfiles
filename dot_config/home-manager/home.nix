{ config, pkgs, ... }:

{
  home.username = "mimikun";
  home.homeDirectory = "/home/mimikun";

  # NOTE: DO NOT CHANGE IT!!!
  home.stateVersion = "24.05";

  home.packages = [
    pkgs.clipboard-jh
    pkgs.process-compose
    pkgs.circumflex
    pkgs.tracexec
    pkgs.cpufetch
  ];

  # Home Manager is pretty good at managing dotfiles.
  # The primary way to manage plain files is through 'home.file'.
  home.file = {
  # Building this configuration will create a copy of 'dotfiles/screenrc' in the Nix store.
  # Activating the configuration will then make '~/.screenrc' a symlink to the Nix store copy.
    #".screenrc".source = dotfiles/screenrc;
  };

  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mimikun/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
