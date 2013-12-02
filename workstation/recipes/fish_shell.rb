brew "fish"

execute "Add fish to /etc/shells" do
  command "echo '/usr/local/bin/fish' | sudo tee -a /etc/shells"
  not_if "grep -q fish /etc/shells"
end
