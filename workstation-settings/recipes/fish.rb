%w{functions plugins}.each do |dir|
  directory "#{node['sprout']['home']}/.config/fish/#{dir}" do
    recursive true
  end
end

template "#{node['sprout']['home']}/.config/fish/config.fish" do
  source "config.fish.erb"
end

template "#{node['sprout']['home']}/.config/fish/functions/fish_prompt.fish" do
  source "fish/functions/fish_prompt.fish.erb"
end

%w{git heroku bundler vim}.each do |fish_config|
  template "#{node['sprout']['home']}/.config/fish/plugins/#{fish_config}.fish" do
    source "fish/plugins/#{fish_config}.fish.erb"
  end
end
