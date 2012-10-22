%w{DroidSansMono-Powerline.ttf DroidSansMonoDotted-Powerline.ttf DroidSansMonoSlashed-Powerline.ttf}.each do |font|
  cookbook_file "#{ENV['HOME']}/Library/Fonts/#{font}" do
    source font
    mode "0645"
  end
end
