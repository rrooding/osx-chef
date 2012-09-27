package 'ack'

template "#{ENV['HOME']}/.ackrc" do
  source "ackrc.erb"
end
