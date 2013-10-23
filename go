#!/bin/bash

# Save current working directory
pushd `pwd`

# Install the soloist gem
if rvm --version 2>/dev/null; then
  gem install --no-ri --no-rdoc soloist
else
  sudo gem install --no-ri --no-rdoc soloist
fi

# Prepare the cookbooks
#mkdir -p ~/.soloist; cd ~/.soloist
if [[ -d .soloist ]]; then
  cd .soloist && git pull
else
  git clone https://github.com/rrooding/osx-chef.git .soloist && cd .soloist
  git checkout mavericks
fi

#cat > soloistrc <<EOF
#cookbook_paths:
#- $PWD
#
#recipes:
#- sprout-osx-base::bash_it
#EOF

# Execute soloist
soloist

# Return to starting working directory
popd
