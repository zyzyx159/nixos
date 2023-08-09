#!/bin/bash

#Install home manager channel
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
nix-channel --update

#Add home manager to the path
export NIX_PATH="$HOME/.nix-defexpr/channels${NIX_PATH:+:$NIX_PATH}"

#Run the nixos home_manger install
nix-shell '<home-manager>' -A install

#Make a git folder
mkdir ~/git
cd ~/git

#Pull down my nixos configs
nix-shell -p git --run "git clone https://github.com/zyzyx159/nixos.git"

#Remove old nixos config and replace it with git
sudo rm /etc/nixos/configuration.nix
sudo ln -s ~/git/nixos/configuration.nix /etc/nixos/configuration.nix

#Remove old home manager config and replace it
#*** this script is designed for single user systems. Changes will need to be made if you want more than one home-manager config.***
rm ~/.config/home-manager/home.nix
ln -s ~/git/nixos/home.nix ~/.config/home-manager/home.nix

#Run the NixOS Installer
sudo nixos-rebuild switch

#Reboot the PC
sudo reboot -h now
