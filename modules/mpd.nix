{ config, ... }: {
  home.file.".config/mpd".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nordwolf/config/mpd";
}
