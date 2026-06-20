{ config, ... }: {
  home.file.".config/vicinae".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nordwolf/config/vicinae";
}
