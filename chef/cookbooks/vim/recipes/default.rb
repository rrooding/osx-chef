package 'macvim'

execute 'curl -Lo- https://bit.ly/janus-bootstrap | bash' do
  creates "#{ENV['HOME']}/.janus/"
end

template "#{ENV['HOME']}/.vimrc.before" do
  source 'vimrc.before.erb'
end

template "#{ENV['HOME']}/.vimrc.after" do
  source 'vimrc.after.erb'
end
