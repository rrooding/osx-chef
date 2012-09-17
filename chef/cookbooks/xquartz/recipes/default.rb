unless node['platform'] == 'mac_os_x' && node['platform_version'].to_f >= 10.8
  Chef::Log.warn "#{cookbook_name} is really only suitable for OS X 10.8+,"
  Chef::Log.warn "as X11 is available in earlier releases."
  return
end

dmg_package "XQuartz" do
  source "http://xquartz.macosforge.org/downloads/SL/XQuartz-#{node['xquartz']['version']}.dmg"
  checksum node['xquartz']['checksum']
  volumes_dir "XQuartz-#{node['xquartz']['version']}"
  type 'pkg'
end
