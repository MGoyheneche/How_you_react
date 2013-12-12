class VideosController < ApplicationController
  def show
  	# Latency = 9sec

  	# HardWorker.perform_in(2.5.minutes, 'bob', '5')

  end

  def last_picture
  	@picture = Picture.last
  end
end
