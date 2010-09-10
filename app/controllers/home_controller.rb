class HomeController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @menu_id=:root
    if user_signed_in?
      render "signed_in"
    else
      render "signed_out"
    end
  end

  def tos
    
  end
  
  def privacy
    
  end

end
