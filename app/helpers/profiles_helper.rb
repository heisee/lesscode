module ProfilesHelper
  def filtered_profiles
    if params[:personal]=="true"
      current_user.profiles
    else
      Profile.all
    end
  end
end
