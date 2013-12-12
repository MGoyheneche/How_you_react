# app/workers/hard_worker.rb
class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
  	# require 'fileutils'

    # puts "killall PTPCamera"
    system "killall PTPCamera"

    # puts "gphoto2 --capture-image-and-download"
    system "gphoto2 --capture-image-and-download"

    puts "@picture = Picture.new()"
    @picture = Picture.new(:url => "efwefwe")


    puts "picture.save"
    if @picture.save


      # puts "mkdir public/picture"
      system "mkdir public/pictures/#{@picture.id}"


      # puts "mv capt0000..."
      system "mv capt0000.jpg public/pictures/#{@picture.id}/"


      puts "OAuth Authenticate"
      # Authenticate via OAuth
      client = Tumblr::Client.new({
        :consumer_key => 'QStAzUR41bd7tfJX3soicLvhGacoxwSJJXxNIWDKQDbHWLvIUS',
        :consumer_secret => '1YPZ9WkffkUR9zLInqNHD6O67DEUVT3zhFrMSel2s8ioIwztL1',
        :oauth_token => 'sgVaVQxdCPIBFkacjQ8Nwf1SW4U0IDgrme7eZineGhuSILnEhb',
        :oauth_token_secret => 'm2cTd3bRffC5cJ1VVhHPuYYKFbEuaGJp4awPycKnHMi0mGoKMe'
      })


      puts "setting picture path"
      picture_path = "public/pictures/#{@picture.id}/capt0000.jpg"


      puts "making request to tumblr"
      # Make the request
      client.photo("howyoureact.tumblr.com", {:data => [picture_path]})

    end

  end
end
