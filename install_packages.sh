#!/bin/bash

# Original Script: Atom-X-Devs from [1]
# [1]: https://github.com/Atom-X-Devs/atomx-docker

# Copyright (c) 2022, Atom-X-Devs <https://github.com/Atom-X-Devs>
# Copyright (c) 2022, Devang Chaudhary <devangsingh369@gmail.com> 

clear

# Uncomment community [multilib] repository
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# Update
sudo pacman -Syyu --needed --noconfirm 2>&1 | grep -v "warning: could not get file information"

# Install Basic Packages
sudo pacman -Sy --needed --noconfirm \
	sudo nano git curl wget rsync aria2 rclone \
	python3 python-pip zip unzip cmake graphviz \
	make neofetch speedtest-cli inetutils cpio \
	jdk8-openjdk lzip dpkg openssl ccache repo \
	libelf base-devel openssh lz4 jq go ncurses \
	bison flex ninja uboot-tools z3 glibc dpkg \
	multilib-devel bc htop python-setuptools   \
	util-linux man tmate tmux screen mlocate \
        unace unrar p7zip patchelf lld llvm imagemagick \
	sharutils uudeview arj cabextract file-roller \
	dtc brotli axel gawk detox clang gcc gcc-libs \
	flatpak zsh asp kmod pahole xmlto python-sphinx \
	python-sphinx_rtd_theme svn github-cli

# zsh
sudo chsh -s /bin/zsh root
curl -sL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh

# Install Some pip packages
sudo pip install \
	twrpdtgen telegram-send backports.lzma docopt \
	extract-dtb protobuf pycrypto docopt zstandard \
	setuptools

# pip git packages
sudo pip install \
	git+https://github.com/samloader/samloader.git

# Fix pod2man missing error
export PATH=/usr/bin/core_perl:$PATH

# Create a symlink for z3
ln -s /usr/lib/libz3.so /usr/lib/libz3.so.4