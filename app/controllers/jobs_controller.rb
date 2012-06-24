class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.json
  def search
    if !user_signed_in?
    
    else
      @user = current_user
    
      @saved_jobs = SavedJob.where(:user_id => current_user.id)
      @saved_companies = SavedCompany.where(:user_id => current_user.id)
    end

    internship = []
    if '1' == params[:job] 
      internship << false
    end
    if '1' == params[:internship]
      internship << true
    end
    
    stage = []
    if '1' == params[:stage_one]
      stage << 1
    end
    if '1' == params[:stage_two]
      stage << 2
    end
    if '1' == params[:stage_three]
      stage << 3
    end
    
    technical = []
    if '1' == params[:not_technical]
      technical << false
    end
    if '1' == params[:technical]
      technical << true
    end
    
    @jobs = Job.joins(:company).where("jobs.internship in (?) AND companies.stage in (?) and jobs.technical in (?)", internship, stage, technical)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @jobs }
    end
  end

  def index
    if !user_signed_in?
    
    else
      @user = current_user
    
      @saved_jobs = SavedJob.where(:user_id => current_user.id)
      @saved_companies = SavedCompany.where(:user_id => current_user.id)
    end
    
    @jobs = Job.includes(:company).all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])
    @company =Company.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(params[:job])

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, :notice => 'Job was successfully created.' }
        format.json { render :json => @job, :status => :created, :location => @job }
      else
        format.html { render :action => "new" }
        format.json { render :json => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to @job, :notice => 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end
end
