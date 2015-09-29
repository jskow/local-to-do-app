class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET /places
  # GET /places.json
  def index
    if params[:latitude] then 
      @location = Location.find_by(latitude: params[:latitude])
      search_by(@location)
      @places = Place.all
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

    def search_by(location)
      #init Google places API
      @client = GooglePlaces::Client.new("AIzaSyDpPub0LTxbwkY6EAwKd00cbXAiUs-nIKM")
      #sort requirements
      @activity = sort_reqs(location)
      #perform search with lat,long and types
      #types found at https://developers.google.com/places/supported_types
      @spots = @client.spots(location.latitude, location.longitude, :types => 'restaurant')
      #sort spots into individual places
      @places = sort_spots(@spots)
    end 

    def sort_spots(spots)
      #for n spots, transfer data into n places
      spots.each do |spot|
        Place.create(name: spot.name)
      end
    end

    def sort_reqs(location)
      #sort by money, group size, age, social and over 21
      @activity = Activity.find_by(cost: location.cost )
      #choose the first activity, return 
      return @activity
    end
end
