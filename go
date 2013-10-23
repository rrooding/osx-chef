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
- pivotal_workstation::chrome
EOF

if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/pivotal/pivotal_workstation.git
fi

if [[ -d dmg ]]; then
  cd dmg && git pull && cd ..
else
  git clone https://github.com/opscode-cookbooks/dmg.git
fi

# Execute soloist
soloist

# Return to starting working directory
popd
