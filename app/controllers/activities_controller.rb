class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
    if (cookies[:location_id]) then 
      #take in location with requirement data
      loc_id = cookies[:location_id].to_i
      @location = Location.find_by(id: loc_id)
      #use requirement data to determine activities to show
      #@activities = Activity.where("cost <= ? AND group_size <= ? AND age <= ?", @location.cost, @location.group_size, @location.age).order("image_alt DESC").paginate(page: params[:page], per_page: 1)
      #byebug
      #check if cookies need to be deleted
    
      if cookies[:act_hash] then
        act_hash_loc_check = JSON.parse(cookies[:act_hash])
        if act_hash_loc_check["loc_id"] != cookies[:location_id] then
          delete_cookies
        end
      end

      #create index of the activities chosen
      #byebug
      #check whether or not to create the hash
      if cookies[:act_hash] then
        #find current page, and move to next
        #this should only load on first call? then delete cookie?
      else
        #if no index, then find it and define initial page
        #byebug
        @activities = Activity.where("cost <= ? AND group_size <= ? AND age <= ?", @location.cost, @location.group_size, @location.age)
        act_hash = find_act_hash(@activities)
        cookies[:current_page] = act_hash[0]
        cookies[:next_page] = act_hash[1]
      end
      #create cookie with index
      #create link to go to next page based on cookie
      #TEST
      if (params[:page]) then
        cookies[:current_page] = params[:page]
      end
      @activities = Activity.where("cost <= ? AND group_size <= ? AND age <= ?", @location.cost, @location.group_size, @location.age).paginate(page: cookies[:current_page].to_i, per_page: 1)

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

    def randomize(activities)
       #shuffle array 0 to n elements
       n = activities.length
       act_index = [*1..n]
       i = n-1
       
       until i == 1 do
         #choose random number j 0<=j<=i
         j = rand(i)
         first = act_index[j]
         second = act_index[i]
         act_index[j] = second
         act_index[i] = first
         i-=1
       end
      return act_index
    end
    
    #get array of activity indicies
    #need a hash of index/page and id
    def find_act_hash(activities)
      #byebug
      act_index = randomize(activities)
      act_hash = { } 
      i = 0
      activities.each do |activity|
      #can't use ID, need to use index in activities
        act_hash[i] = act_index[i].to_s
        i+=1
      end
      act_hash["loc_id"] = cookies[:location_id]
      cookies[:act_hash] = JSON.generate(act_hash)
      return act_hash
    end

    def delete_cookies
      cookies.delete(:act_hash, domain: :all)
      cookies.delete(:current_page, domain: :all)
      cookies.delete(:next_page, domain: :all)
    end

end
