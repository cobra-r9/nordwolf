{ config, pkgs, ... }:
{
  services.mpd = {
    enable = false;
    musicDirectory = config.xdg.userDirs.music;
    dataDir = "${config.home.homeDirectory}/.local/share/mpd";

    extraConfig = ''
      audio_output {
        type  "pipewire"
        name  "PipeWire"
      }
    '';
  };
}
