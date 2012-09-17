unless File.directory?("/Applications/GitX.app")
  remote_file "#{Chef::Config[:file_cache_path]}/GitXStable.app.zip" do
    source "http://frim.frim.nl/GitXStable.app.zip"
    checksum node['gitx']['checksum']
  end

  execute 'unpack GitX' do
    command "unzip -q #{Chef::Config[:file_cache_path]}/GitXStable.app.zip"
    cwd "/Applications"
    not_if { File.directory?("/Applications/GitX.app") }
  end

  link "/usr/local/bin/gitx" do
    to "/Applications/GitX.app/Contents/Resources/gitx"
    only_if { File.directory?("/Applications/GitX.app") }
  end
end
