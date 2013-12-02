include_recipe "sprout-osx-apps::heroku_toolbelt"

execute "Install heroku:accounts plugin" do
  command "heroku plugins:install git://github.com/ddollar/heroku-accounts.git"
  not_if "heroku plugins | grep heroku-accounts"
end
