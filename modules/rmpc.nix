{ config, ... }: {
  home.file.".config/rmpc".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nordwolf/config/rmpc";
}
