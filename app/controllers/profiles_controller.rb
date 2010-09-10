class ProfilesController < ApplicationController

  before_filter :set_menu_id

  def set_menu_id
    @menu_id=:profile_mgmt
  end
  
  # GET /Profiles
  # GET /Profiles.xml
  def index
    @profiles = current_user.profiles

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profiles }
    end
  end

  # GET /Profiles/1
  # GET /Profiles/1.xml
  def show
    @profile = current_user.profiles.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /Profiles/new
  # GET /Profiles/new.xml
  def new    
    @profile = ProfilePerson.new(:available_from_type=>"now", :available_duration_type=>"depends")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /Profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /Profiles
  # POST /Profiles.xml
  def create
    @profile = Profile.new(params[:profile])
    @profile.user=current_user
    @profile.type=params[:profile][:type]

    respond_to do |format|
      if @profile.save
        format.html { redirect_to(@profile, :notice => 'Profile was successfully created.') }
        format.xml  { render :xml => @profile, :status => :created, :location => @profile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Profiles/1
  # PUT /Profiles/1.xml
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:Profile])
        format.html { redirect_to(@profile.becomes(Profile), :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /Profiles/1
  # DELETE /Profiles/1.xml
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to(profiles_url) }
      format.xml  { head :ok }
    end
  end

end
