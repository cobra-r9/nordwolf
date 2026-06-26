{ config, ... }: {
  home.file.".config/ncmpcpp".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nordwolf/config/ncmpcpp";
}
