class PlacesController < ApplicationController

  def home

    
  end

  def goog_init
    @client = GooglePlaces::Client.new(AIzaSyDpPub0LTxbwkY6EAwKd00cbXAiUs-nIKM)
    @spot = place_search
  end

  def place_search
    @spot = @client.spots_by_query('Pizza near Miami Florida', :types => ['restaurant', 'food'], :exclude => ['cafe', 'establishment'])
  end

end
