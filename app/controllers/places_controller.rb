class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    if cookies[:activity_id] && cookies[:location_id] then
      loc_id = cookies[:location_id].to_i
      act_id = cookies[:activity_id].to_i 
      @location = Location.find_by(id: loc_id)
      @activity = Activity.find_by(id: act_id)
      if (Place.find_by(search_id: @location.id, activity_id: @activity.id).nil?) then
      search_by(@location, @activity)
      end
      @places = Place.where("search_id = ? AND activity_id = ?", @location.id, @activity.id).order("rating DESC").paginate(page: params[:page], per_page: 1)
    else
      redirect_to root_url
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show

  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params)
    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :price, :activity)
    end

    def search_by(location, activity)
      #init Google places API
     if (location.latitude && location.longitude) then 
      @client = GooglePlaces::Client.new("AIzaSyDpPub0LTxbwkY6EAwKd00cbXAiUs-nIKM")
      #perform search with lat,long and types
      #types found at https://developers.google.com/places/supported_types
      @spots = @client.spots(location.latitude, location.longitude, :types => activity.search_type, :radius => 10000)
      #sort spots into individual places
      @places = sort_spots(@spots, location, activity)
     else
      redirect_to root_url, notice: 'Location error'
     end
    end 

    def sort_spots(spots, location, activity)
      #for n spots, transfer data into n places
      spots.each do |spot|
        Place.create(name: spot.name, search_id: location.id, activity_id: activity.id, formatted_address: spot.vicinity, rating: spot.rating, url: spot.url)
      end
    end

end
