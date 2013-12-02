brew "chruby"
brew "ruby-install"

%w{bash zsh}.each do |shell|
  execute "Add chruby to #{shell}" do
    command "echo 'source /usr/local/opt/chruby/share/chruby/chruby.sh' | tee -a #{node['sprout']['home']}/.#{shell}rc"
    not_if "grep -q chruby #{node['sprout']['home']}/.#{shell}rc"
  end

  execute "Add chruby autoloading to #{shell}" do
    command "echo 'source /usr/local/opt/chruby/share/chruby/auto.sh' | tee -a #{node['sprout']['home']}/.#{shell}rc"
    not_if "grep -q auto #{node['sprout']['home']}/.#{shell}rc"
  end
end

node['rubies']['list'].each do |ruby|
  execute "Installing #{ruby}" do
    command "ruby-install #{ruby}"
    not_if { ruby_installed?(ruby) }
  end
end

def ruby_installed?(ruby)
  ::File.exists?("/opt/rubies/#{ruby.gsub(' ', '-')}/bin/ruby")
end
