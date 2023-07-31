#!/bin/bash
mkdir ~/git
cd ~/git
nix-shell -p git --run "git clone https://github.com/zyzyx159/nixos.git"
sudo rm /etc/nixos/configuration.nix
sudo ln -s ~/git/nixos/configuration.nix /etc/nixos/configuration.nix
sudo NixOS-rebuild switch
