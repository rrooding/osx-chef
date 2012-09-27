execute 'Install RVM' do
  command 'curl -L https://get.rvm.io | bash -s stable'
  not_if { File.directory?("#{ENV['HOME']}/.rvm/") }
end

template "#{ENV['HOME']}/.gemrc" do
  source "gemrc.erb"
end

template "#{ENV['HOME']}/.rvmrc" do
  source "rvmrc.erb"
end
