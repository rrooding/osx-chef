package 'tmux'

template "#{ENV['HOME']}/.tmux.conf" do
  source 'tmux.conf.erb'
end
