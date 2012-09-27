execute 'git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh' do
  creates "#{ENV['HOME']}/.oh-my-zsh/"
end

template "#{ENV['HOME']}/.zshrc" do
  source 'zshrc.erb'
end

execute "sudo chsh -s /bin/zsh #{ENV['USER']}"
