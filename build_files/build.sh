#!/bin/bash

set -ouex pipefail

log () { echo "=== $* ==="; }

# Niri packages
log "installing Niri packages"
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
log "configuring terra repository (and awww)"
sudo dnf install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
dnf5 install -y awww
log "terra install complete"

# Pre install Apps
log "copying flatpaks list"
cp /ctx/custom/flatpaks etc/flatpak/preinstall.d/flatpaks

log "copying brewsfiles"
cp /ctx/custom/brews /usr/share/ublue-os/homebrew/brews

log "installing flatpaks"
xargs -a /etc/flatpak/preinstall.d/flatpaks flatpak --system -y install
log "flatpaks installation done"

log "installing brews"
xargs -a /usr/share/ublue-os/homebrew/brews brew install
log "brews installation done"

log "copying Brewfiles"
cp /ctx/custom/*.Brewfile /usr/share/ublue-os/homebrew/

