unless File.directory?("/Applications/iTerm.app")
  remote_file "#{Chef::Config[:file_cache_path]}/iTerm2-#{node['iterm2']['version']}.zip" do
    source "http://iterm2.googlecode.com/files/iTerm2-#{node['iterm2']['version']}.zip"
    checksum node['iterm2']['checksum']
  end

  execute 'unpack iTerm2' do
    command "unzip -q #{Chef::Config[:file_cache_path]}/iTerm2-#{node['iterm2']['version']}.zip"
    cwd "/Applications"
    not_if { File.directory?("/Applications/iTerm.app") }
  end

  remote_file "#{Chef::Config[:file_cache_path]}/solarized-dark.itermcolors" do
    source "https://raw.github.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors"
  end

  execute 'install Solarized Dark for iTerm2' do
    command "open #{Chef::Config[:file_cache_path]}/solarized-dark.itermcolors"
  end
end
