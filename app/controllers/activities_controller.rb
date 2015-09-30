class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
    if (params[:latitude] && params[:longitude]) then 
      #take in location with requirement data
      @location = Location.find_by(latitude: params[:latitude])
      #use requirement data to sort activities
      sort_reqs(@location)
      #put activities into array, show each activity with click
      #after choosing activity, send to places
    else

    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show

  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:name, :cost, :gender, :group_size, :type1, :type2, :age)
    end

    # Function to sort activities based on given requirements
    def sort_reqs(location)
      #find activities first by cost and group size(mandatory)
      @activities = Activity.find_by(cost: location.cost, group_size: location.group_size)
      #if age is provided, sort by age
      if !location.age.nil? then
        @activities.sort(age: location.age)
      else
        #do nothing
      end #age check
      @activities.each do |activity|
        @act_ids = activity.index
      end #create index array
      return @activities
    end

end
