class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    if !user_signed_in?
      render :index
    else
      @user = current_user
      @jobs = Job.all(:include => :company)
      render :index
    end
  end
end
