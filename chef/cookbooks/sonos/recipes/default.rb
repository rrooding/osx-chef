dmg_package "Sonos Desktop Controller" do
  dmg_name "SonosDesktopController#{node['sonos']['version']}"
  source "http://update.sonos.com/software/mac/mdcr/SonosDesktopController#{node['sonos']['version']}.dmg"
  checksum node['sonos']['checksum']
  accept_eula true
  not_if { File.directory?("/Applications/Sonos.app") }
end
