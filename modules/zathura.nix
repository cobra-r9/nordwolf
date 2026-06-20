{ config, ... }: {
  home.file.".config/zathura".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nordwolf/config/zathura";
}
