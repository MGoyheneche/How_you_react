# app/workers/hard_worker.rb
class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
  	# require 'fileutils'

    puts "hello"
    puts name

    # system "killall PTPCamera"
    # system "gphoto2 --capture-image-and-download"
    # system "ls"
    # system "mv capt0000.jpg ~/Dropbox/Public/Tumblr/Upload/"

    # Authenticate via OAuth
    client = Tumblr::Client.new({
      :consumer_key => 'QStAzUR41bd7tfJX3soicLvhGacoxwSJJXxNIWDKQDbHWLvIUS',
      :consumer_secret => '1YPZ9WkffkUR9zLInqNHD6O67DEUVT3zhFrMSel2s8ioIwztL1',
      :oauth_token => 'sgVaVQxdCPIBFkacjQ8Nwf1SW4U0IDgrme7eZineGhuSILnEhb',
      :oauth_token_secret => 'm2cTd3bRffC5cJ1VVhHPuYYKFbEuaGJp4awPycKnHMi0mGoKMe'
    })

    # Make the request
    client.photo("howyoureact-test.tumblr.com", {:data => ['/_____68_II_1440_900.jpg']})


  end
end
