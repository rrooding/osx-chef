%w{functions plugins}.each do |dir|
  directory "#{node['sprout']['home']}/.config/fish/#{dir}" do
    recursive true
    user node['current_user']
  end
end

template "#{node['sprout']['home']}/.config/fish/config.fish" do
  source "config.fish.erb"
  user node['current_user']
end

template "#{node['sprout']['home']}/.config/fish/functions/fish_prompt.fish" do
  source "fish/functions/fish_prompt.fish.erb"
  user node['current_user']
end

%w{git heroku bundler vim custom}.each do |fish_config|
  template "#{node['sprout']['home']}/.config/fish/plugins/#{fish_config}.fish" do
    source "fish/plugins/#{fish_config}.fish.erb"
    user node['current_user']
  end
end
