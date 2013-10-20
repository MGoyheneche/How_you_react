# app/workers/hard_worker.rb
class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
  	# require 'fileutils'

    puts "hello"
    puts name

    system "killall PTPCamera"
    system "gphoto2 --capture-image-and-download"
    system "ls"
    system "mv capt0000.jpg ~/Dropbox/Public/Tumblr/Upload/"

		# FileUtils.mv('capt0000.jpg', '~/Desktop/capt0000.jpg')
  end
end
