require 'pathname'

package 'mysql'

execute 'Installing default mysql databases' do
  command 'mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp >/dev/null'

  not_if { File.exist? '/usr/local/var/mysql' }
end

ruby_block 'copy mysql plist to ~/Library/LaunchAgents' do
  plist_destination = File.expand_path(File.join('~', 'Library', 'LaunchAgents', 'homebrew.mxcl.mysql.plist'))

  block do
    active_mysql = Pathname.new("/usr/local/bin/mysql").realpath
    plist_location = File.expand_path(File.join(active_mysql, '../../', 'homebrew.mxcl.mysql.plist'))
    system "cp #{plist_location} #{plist_destination}"
  end

  not_if { File.exists? plist_destination }
end

service 'mysql' do
  plist_destination = File.expand_path(File.join('~', 'Library', 'LaunchAgents', 'homebrew.mxcl.mysql.plist'))

  service_name 'homebrew.mxcl.mysql'
  supports :status => true
  action [ :start ]

  only_if { File.exists? plist_destination }
end
