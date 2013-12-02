template "#{node['sprout']['home']}/.gemrc" do
  source "gemrc.erb"
end

template "#{node['sprout']['home']}/.ruby-version" do
  source "ruby-version.erb"
end
