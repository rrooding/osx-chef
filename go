#!/bin/bash

function log {
  echo -e "\033[1;31m>> \033[0;34m$*\033[0m"
}

function error {
  echo -e "\033[1;31m!! \033[1;31m$*\033[0m"
}

function ask {
  echo -e "\033[1;32m?? \033[0;32m$*\033[0m"
}

function pause {
  read -p "$*"
}

function clean_and_exit {
  error 'Cleaning up and exiting'
  rm -rf $WORK_DIR
  exit $1
}

function check_xcode {
  if [ ! $(xcode-select --print-path 2>/dev/null) ]; then
    error 'Xcode not found'
    pause 'Please install Xcode 4.4.1. Press [enter] to continue...'
    check_xcode
  else
    log 'Xcode found, continuing...'
  fi
}

function check_git {
  if [ ! $(which git 2>/dev/null) ]; then
    error 'Git not found'
    pause 'Please install the Command Line Tools (Xcode Preferences -> Downloads). Press [enter] to continue...'
  else
    log 'Git found, continuing...'
  fi
}

function check_system_ruby {
  if [ ! "$(ruby -v | grep '1.8' 2>/dev/null)" ]; then
    error 'Ruby 1.8 not found, this should be packaged with OS X'
    clean_and_exit 1
  else
    log 'Ruby 1.8 found, continuing...'
  fi
}

function check_install_chef_solo {
  if [ ! $(which chef-solo 2>/dev/null) ]; then
    log 'Chef-solo not found, installing...'
    sudo gem install chef --no-ri --no-rdoc >/dev/null || clean_and_exit 1
  else
    log 'Chef-solo found, continuing...'
  fi
}

function init_submodules {
  git submodule init >/dev/null || clean_and_exit 1
  git submodule update --quiet || clean_and_exit 1
}

echo -e "\033[1;32mMaking your Mac more awesome...\033[0m"

# Working directory for file downloads
WORK_DIR="/tmp/osx-chef-`date +%s`"
mkdir -p $WORK_DIR

# Ask for password upfront
sudo -v
if [ "$?" -ne "0" ]; then
  error "We can't continue without a password"
  clean_and_exit 1
fi

# Keep-alive: update existing `sudo` time stamp until 'go' has finished
while true; do sudo -n true; sleep 30; kill -0 "$$" || exit; done 2>/dev/null &

# Create /usr/local if it doesn't exist
if [ ! -d "/usr/local" ]; then
  sudo mkdir -p /usr/local
  sudo chmod g+rwx /usr/local
  sudo chgrp admin /usr/local
fi

# Create ~/Library/LaunchAgents
if [ ! -d "~/Library/LaunchAgents" ]; then
  mkdir -p ~/Library/LaunchAgents
fi

log 'Checking for XCode installation'
check_xcode

log 'Checking for git'
check_git
init_submodules

log 'Checking system ruby'
check_system_ruby

log 'Checking for chef-solo'
check_install_chef_solo

log 'Starting Chef'
chef-solo -c chef/config/solo.rb -j chef/config/ralphs-macbook-pro.json $*
