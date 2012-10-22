package 'macvim'

execute 'curl -Lo- https://bit.ly/janus-bootstrap | bash' do
  creates "#{ENV['HOME']}/.vim/janus/"
end

%w{vimrc.before vimrc.after}.each do |tpl|
  template "#{ENV['HOME']}/.#{tpl}" do
    source "#{tpl}.erb"
  end
end

{ 'git://github.com/Lokaltog/vim-powerline.git' => 'vim-powerline',
  'git://github.com/altercation/vim-colors-solarized.git' => 'vim-colors-solarized',
  'git://github.com/tpope/vim-unimpaired.git' => 'vim-unimpaired'}.each do |plugin, path|
  execute "git clone #{plugin} #{ENV['HOME']}/.janus/#{path}" do
    creates "#{ENV['HOME']}/.janus/#{path}"
  end
end
