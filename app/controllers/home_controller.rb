class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    if !user_signed_in?
      render :splash
    else
      @user = current_user
      @jobs = Job.all(:include => :company)
      @saved_jobs = SavedJob.where(:user_id => current_user.id)
      @saved_companies = SavedCompany.where(:user_id => current_user.id)
      
      render :index
    end
  end
end
