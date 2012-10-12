unless File.directory?("/Applications/Transmit.app")
  remote_file "#{Chef::Config[:file_cache_path]}/Transmit #{node['transmit']['version']}.zip" do
    source "http://www.panic.com/transmit/d/Transmit%20#{node['transmit']['version']}.zip"
    checksum node['transmit']['checksum']
  end

  execute 'unpack Transmit' do
    command "unzip -q #{Chef::Config[:file_cache_path]}/Transmit #{node['transmit']['version']}.zip"
    cwd "/Applications"
    not_if { File.directory?("/Applications/Transmit.app") }
  end
end
