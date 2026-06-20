{ pkgs, ... }:
let
  nordicTheme = {
    package = pkgs.nordic;
    name = "Nordic-darker";
  };
in
{
  gtk = {
    enable = true;
    colorScheme = "dark";
    
    theme = nordicTheme;
    gtk4.theme = nordicTheme;

    iconTheme = {
      name = "Nordic-darker";
    };
  };
}

