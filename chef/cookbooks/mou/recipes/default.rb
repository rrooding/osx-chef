unless File.directory?("/Applications/Mou.app")
  remote_file "#{Chef::Config[:file_cache_path]}/Mou.zip" do
    source "http://mouapp.com/download/Mou.zip"
    checksum "da2e2aab2d4881edd82a3626b6a7a83a3584e5fb"
  end

  execute 'unpack Mou' do
    command "unzip -q #{Chef::Config[:file_cache_path]}/Mou.zip"
    cwd "/Applications"
    not_if { File.directory?("/Applications/Mou.app") }
  end
end
