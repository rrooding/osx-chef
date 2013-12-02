execute 'curl -Lo- https://bit.ly/janus-bootstrap | bash' do
  creates "#{ENV['HOME']}/.vim/janus/"
end
