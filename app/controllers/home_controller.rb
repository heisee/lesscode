class HomeController < ApplicationController
  #before_filter :authenticate_user!

  def index
    if user_signed_in?
      render "signed_in"
    else
      render "signed_out"
    end
  end

  
end
