#!/bin/bash

# Save current working directory
pushd `pwd`

# Install the soloist gem
if rvm --version 2>/dev/null; then
  gem install soloist
else
  sudo gem install soloist
fi

# Prepare the cookbooks
mkdir -p ~/.soloist; cd ~/.soloist

cat > soloistrc <<EOF
cookbook_paths:
- $PWD

recipes:
- sprout-osx-base::bash_it
EOF

# Execute soloist
soloist

# Return to starting working directory
popd
