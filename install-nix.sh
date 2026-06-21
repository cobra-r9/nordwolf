#!/bin/bash

sh <(curl -L https://nixos.org/nix/install) --daemon

nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs

nix-shell '<home-manager>' -A install

