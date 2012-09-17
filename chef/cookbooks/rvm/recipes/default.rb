execute 'Install RVM' do
  command 'curl -L https://get.rvm.io | bash -s stable'
  not_if { File.directory?("#{ENV['HOME']}/.rvm/") }
end

execute 'Upgrade RVM' do
  command 'rvm get head'
  only_if { File.directory?("#{ENV['HOME']}/.rvm/") }
end
