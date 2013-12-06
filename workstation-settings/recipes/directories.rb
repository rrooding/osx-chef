%w{personal oss}.each do |dir|
  directory "#{node['sprout']['home']}/#{node["workspace_directory"]}/#{dir}" do
    owner node['current_user']
    mode "0755"
    action :create
  end
end
