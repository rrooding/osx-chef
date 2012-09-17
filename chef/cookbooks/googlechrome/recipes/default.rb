dmg_package "Google Chrome" do
  dmg_name "googlechrome"
  source "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
  checksum 'e93a1488df4982040ad5bc76a2239c6d4687f650'
  not_if { File.directory?("/Applications/Google Chrome.app") }
end
