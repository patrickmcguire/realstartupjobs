class ApplicationController < ActionController::Base
  protect_from_forgery
  @jobs = Job.includes(:company).all
  
 # before_filter :authenticate_user!
end
