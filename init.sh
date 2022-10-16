#!/bin/bash

APPLY_USER=${USER}

sudo -i
echo 'Defaults editor=/usr/bin/vim' >> /etc/sudoers
echo "${APPLY_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

echo 'export EDITOR=vim' >> ~/.bashrc
echo 'alias ll="ls -l --color=auto"' >> ~/.bashrc

