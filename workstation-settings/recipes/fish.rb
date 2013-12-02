%w{fish_prompt}.each do |fish_config|
  template "#{node['sprout']['home']}/.config/fish/functions/#{fish_config}.fish" do
    source "#{fish_config}.fish.erb"
  end
end
