brew "fish"

bash "echo '/usr/local/bin/fish' | tee -a /etc/shells" do
  user "root"
  not_if "grep -q fish /etc/shells"
end
