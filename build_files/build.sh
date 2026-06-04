#!/bin/bash

set -ouex pipefail

# Niri packages
dnf5 install -y niri \
	xdg-desktop-portal-gnome \
	mako \
	rofi \
	playerctl \
	brightnessctl \
	alacritty \
	wl-clipboard \
	kmonad

# configure terra for installing awww
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

dnf5 install -y awww

