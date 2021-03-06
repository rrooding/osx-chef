#!/bin/bash

# Save current working directory
pushd `pwd`

soloist_version=1.0.3

# Install the soloist gem
if ! gem list -v=$soloist_version -i; then
  if rvm --version 2>/dev/null; then
    gem install -N -v=$soloist_version soloist
  else
    sudo gem install -N -v=$soloist_version soloist
  fi
fi

# Prepare the cookbooks
if [[ -d .soloist ]]; then
  cd .soloist && git pull
else
  git clone https://github.com/rrooding/osx-chef.git .soloist && cd .soloist
fi
git checkout master

# Execute soloist
soloist

# Return to starting working directory
popd
