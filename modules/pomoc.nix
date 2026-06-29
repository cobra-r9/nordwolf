{ config, ... }: {
  home.file.".config/pomoc".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nordwolf/config/pomoc";
}
