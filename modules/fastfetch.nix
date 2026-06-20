{ config, ... }: {
  home.file.".config/fastfetch".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/nordwolf/config/fastfetch";
}
