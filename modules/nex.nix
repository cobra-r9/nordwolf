{ config, ... }: {
  home.file.".config/nex".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nordwolf/config/nex";
}
