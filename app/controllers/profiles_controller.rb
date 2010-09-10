class ProfilesController < ApplicationController
  include ProfilesHelper

  before_filter :authenticate_user!, :except=>[:index, :show]
  
  before_filter :set_menu_id

  def set_menu_id
    @menu_id=:profile_mgmt
  end
  
  # GET /Profiles
  # GET /Profiles.xml
  def index
    @profiles = filtered_profiles
    @personal_view=params[:personal]=="true"
    @menu_id=:profile_dir unless @personal_view
    respond_to do |format|
      format.html #index.html.erb
      format.xml  { render :xml => @profiles }
    end
  end

  # GET /Profiles/1
  # GET /Profiles/1.xml
  def show
    @profile = Profile.find(params[:id])
    @menu_id=:profile_dir
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
    possible_types={"ProfilePerson"=>ProfilePerson, "ProfileCompany"=>ProfileCompany}
    model_class=possible_types[params[:profile].delete(:type)] #type ist nicht nicht mass-assignable
    @profile = model_class.new(params[:profile])
    @profile.user=current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to(@profile.becomes(Profile), :notice => 'Profil wurde erfolgreich angelegt.') }
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
      type=params[:profile].delete(:type)
      if type!=@profile.type
        #Klasse ändert sich!
        @profile.type=type
        @profile.save(:validate=>false)
        #@profile.reload
        Profile.uncached do
          @profile=Profile.find(@profile.id) #geht sicher auch besser, ist aber einfach.. unkritisch hier
        end
      end
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(@profile.becomes(Profile), :notice => 'Profil wurde erfolgreich geändert.') }
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

  def skill_suggestions
    @profile = Profile.tag_counts_on(:skills)
  end

end
