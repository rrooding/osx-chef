brew "fish"

bash "echo '/usr/local/bin/fish' | sudo tee -a /etc/shells" do
  not_if "grep -q fish /etc/shells"
end
