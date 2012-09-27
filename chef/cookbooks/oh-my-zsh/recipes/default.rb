execute 'curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh' do
  creates "#{ENV['HOME']}/.oh-my-zsh/"
end

template "#{ENV['HOME']}/.zshrc" do
  source 'zshrc.erb'
end
