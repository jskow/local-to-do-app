class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
    if (params[:location]) then 
      #take in location with requirement data
      @location = Location.find_by(id: params[:location])
      #use requirement data to determine activities to show
      #idea - pass index array to view, use that to cycle
     # @activities = sort_reqs(@location)
      #@activities.paginate(page: params[:page], per_page: 5)
       @activities = Activity.where("cost = ? AND group_size = ? AND age = ?", @location.cost, @location.group_size, @location.age).paginate(page: params[:page], per_page: 1)
    else
      redirect_to root_url
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

    def slide
      respond_to do |format|
        format.js
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
    #iterating, maybe switch to find next activity each click (or ajax upon load)
    #or, save index, then take next value from saved index
    def sort_reqs(location)
      #find activities first by cost and group size(mandatory)
      i=0
      @acts = Activity.where(name: nil)
      Activity.all.each do |activity|
        if (activity.cost == location.cost) && (activity.group_size == location.group_size) then
          #if age is provided, sort by age
          if !location.age.nil? then
            if (activity.age == location.age) then 
            @acts = @acts << activity
            i = i+1
            else
            end #age sort
          else
            #do nothing
          end #age exist?
        else
        end #location and group size sort
      end #find each activity
        if !@acts.nil? then
          delete_act = @acts.first
          @acts.reject!{|act| act == delete_act}
          return @acts
        else
        end
    end #end def

    

end
