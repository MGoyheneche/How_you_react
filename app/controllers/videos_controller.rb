class VideosController < ApplicationController
  def show
  	# Latency = 9sec
  	HardWorker.perform_in(1.minutes, 'bob', '5')
  end
end