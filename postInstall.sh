#!/bin/bash

# install home manager
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
nix-channel --update

#pull my nix configuration
mkdir ~/git
cd ~/git
nix-shell -p git --run "git clone https://github.com/zyzyx159/nixos.git"

#remove old nixos config and replace it with git
sudo rm /etc/nixos/configuration.nix
sudo ln -s ~/git/nixos/configuration.nix /etc/nixos/configuration.nix
sudo nixos-rebuild switch

nix-shell '<home-manager>' -A install
