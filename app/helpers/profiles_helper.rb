module ProfilesHelper
  include ActsAsTaggableOn::TagsHelper
  
  def filtered_profiles
    if params[:personal]=="true"
      current_user.profiles
    else
      Profile.order("id desc").all
    end
  end
end
