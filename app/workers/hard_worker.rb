# app/workers/hard_worker.rb
class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
  	# require 'fileutils'

    puts "hello"
    puts name

    system "killall PTPCamera"
    system "gphoto2 --capture-image-and-download"

    @picture = Picture.new(:url => "efwefwe")
    @picture.save

    Dir.mkdir("public/pictures/#{@picture.id}")
    system "mv capt0000.jpg public/pictures/#{@picture.id}/"

    # Authenticate via OAuth
    client = Tumblr::Client.new({
      :consumer_key => 'QStAzUR41bd7tfJX3soicLvhGacoxwSJJXxNIWDKQDbHWLvIUS',
      :consumer_secret => '1YPZ9WkffkUR9zLInqNHD6O67DEUVT3zhFrMSel2s8ioIwztL1',
      :oauth_token => 'sgVaVQxdCPIBFkacjQ8Nwf1SW4U0IDgrme7eZineGhuSILnEhb',
      :oauth_token_secret => 'm2cTd3bRffC5cJ1VVhHPuYYKFbEuaGJp4awPycKnHMi0mGoKMe'
    })

    picture_path = "public/pictures/#{@picture.id}/capt0000.jpg"

    # Make the request
    client.photo("howyoureact-test.tumblr.com", {:data => [picture_path]})


  end
end
