brew "chruby"

%w{bash zsh}.each do |shell|
  execute "Add chruby to #{shell}" do
    command "echo 'source /usr/local/opt/chruby/share/chruby/chruby.sh' | tee -a #{node['sprout']['home']}/.#{shell}rc"
    not_if "grep -q chruby #{node['sprout']['home']}/.#{shell}rc"
  end

  execute "Add chruby autoloading to #{shell}" do
    command "echo 'source /usr/local/opt/chruby/share/chruby/auto.sh' | tee -a #{node['sprout']['home']}/.#{shell}rc"
    not_if "grep -q chruby #{node['sprout']['home']}/.#{shell}rc"
  end
end
