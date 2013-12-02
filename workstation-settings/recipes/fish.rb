directory "#{node['sprout']['home']}/.config/fish/functions" do
  recursive true
end

%w{fish_prompt}.each do |fish_config|
  template "#{node['sprout']['home']}/.config/fish/functions/#{fish_config}.fish" do
    source "#{fish_config}.fish.erb"
  end
end
