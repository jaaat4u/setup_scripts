#!/usr/bin/env bash
# Copyright (c) 2022, Devang Chaudhary <devangsingh369@gmail.com>

clear

echo "=== Getting your System Ready to build Android! ==="

which "apt"

RESULT=$?
if [ $RESULT -eq 0 ]; then
  
echo "==== Debian Distro Detected! ===="

echo " Proceeding Further..."
sudo apt update
sudo apt upgrade
sudo apt install python3
sudo apt install python3-pip
sudo pip install telegram-send
sudo apt-get install git-core \
                     gnupg \
                     flex \ 
                     bison \
                     build-essential \ 
                     zip \
                     curl \
                     zlib1g-dev \
                     gcc-multilib \
                     g++-multilib \
                     libc6-dev-i386 \
                     libncurses5-dev \
                     lib32ncurses5-dev \
                     x11proto-core-dev \
                     libx11-dev \
                     lib32z1-dev \
                     libgl1-mesa-dev \
                     libxml2-utils \
                     xsltproc \
                     unzip \
                     fontconfig \

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
git clone https://github.com/akhilnarang/scripts
bash scripts/setup/android_build_env.sh 
rm -rf scripts
sudo apt install neofetch 
gh auth login

else
  
echo "==== Arch Based Distro Found! ===="

echo " Continuing with the Setup..."

bash install_packages.sh 
fi


echo "== You are all set to Start Building Amazing Stuff! =="

exit 0