template "#{node['sprout']['home']}/.ackrc" do
  user node['current_user']
  source "ackrc.erb"
end
