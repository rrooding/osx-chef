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

function check_xcode {
  if [ ! $(which xcode-select 2>/dev/null) ]; then
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
    error 'Ruby 1.8 not found, this should be packaged with OSX'
    exit 1
  else
    log 'Ruby 1.8 found, continuing...'
  fi
}

function check_install_chef_solo {
  if [ ! $(which chef-solo 2>/dev/null) ]; then
    log 'Chef-solo not found, installing...'
    gem install chef --no-ri --no-rdoc >/dev/null || exit 1
  fi
}

log 'Checking for XCode installation'
check_xcode

log 'Checking for git'
check_git

log 'Checking system ruby'
check_system_ruby

log 'Checking for chef-solo'
check_install_chef_solo

log 'Starting Chef'
#chef-solo -c chef/config/solo.rb -j chef/config/ralphs-macbook-pro.json $*
