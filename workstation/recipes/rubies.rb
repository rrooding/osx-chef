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

remote_file "/usr/local/opt/chruby/share/chruby/chruby.fish" do
  source "https://gist.github.com/rrooding/7760489/raw/01f70afbb23ebcd822042364757de283b84a60c0/fish-chruby-chruby.fish"
end

remote_file "/usr/local/opt/chruby/share/chruby/auto.fish" do
  source "https://gist.github.com/rrooding/7760489/raw/cbf1766e8f546c4be6c7d3be7f678070f94824ec/fish-chruby-auto.fish"
end

execute "Add chruby to fish" do
  command "echo 'source /usr/local/opt/chruby/share/chruby/chruby.fish' | tee -a #{node['sprout']['home']}/.config/fish/config.fish"
  not_if "grep -q chruby #{node['sprout']['home']}/.config/fish/config.fish"
end

execute "Add chruby autoloading to fish" do
  command "echo 'source /usr/local/opt/chruby/share/chruby/auto.fish' | tee -a #{node['sprout']['home']}/.config/fish/config.fish"
  not_if "grep -q auto #{node['sprout']['home']}/.config/fish/config.fish"
end

node['rubies']['list'].each do |ruby|
  execute "Installing #{ruby}" do
    command "ruby-install #{ruby}"
    not_if { ::File.exists?("/opt/rubies/#{ruby.gsub(' ', '-')}/bin/ruby") }
  end
end
