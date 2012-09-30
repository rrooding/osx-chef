execute 'git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh' do
  creates "#{ENV['HOME']}/.oh-my-zsh/"
end

template "#{ENV['HOME']}/.zshrc" do
  source 'zshrc.erb'
end

user ENV['USER'] do
  action :modify
  shell '/bin/zsh'
end
