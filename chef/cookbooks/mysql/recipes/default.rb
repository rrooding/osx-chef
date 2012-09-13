package 'mysql'

execute 'Installing default mysql databases' do
  command 'mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp'
  not_if { File.exist? '/usr/local/var/mysql' }
end
