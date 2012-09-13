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

log 'Checking for XCode installation'
check_xcode

log 'Checking for git'
check_git

log 'Starting Chef'
chef-solo -c chef/config/solo.rb -j chef/config/ralphs-macbook-pro.json $*
