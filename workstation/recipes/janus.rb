execute 'curl -Lo- https://bit.ly/janus-bootstrap | bash' do
  creates "#{node['sprout']['home']}/.vim/janus/"
end

template "#{node['sprout']['home']}/.vimrc.before" do
  source "vimrc.before.erb"
end
