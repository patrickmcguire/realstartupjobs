class SavedJobsController < ApplicationController
  # GET /saved_jobs
  # GET /saved_jobs.json
  def index
    @saved_jobs = SavedJob.where(:user_id => current_user.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @saved_jobs }
    end
  end

  # GET /saved_jobs/1
  # GET /saved_jobs/1.json
  def show
    @saved_jobs = SavedJob.where(:user_id => current_user.id).order("created_at DESC")

    @saved_job = SavedJob.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @saved_job }
    end
  end

  # GET /saved_jobs/new
  # GET /saved_jobs/new.json
  def new
    @saved_job = SavedJob.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @saved_job }
    end
  end

  # GET /saved_jobs/1/edit
  def edit
    @saved_job = SavedJob.find(params[:id])
  end

  # POST /saved_jobs
  # POST /saved_jobs.json
  def create
    job = Job.find(params[:job_id])
    @saved_job = SavedJob.create(:job_id => params[:job_id], :user_id => current_user().id)

    respond_to do |format|
      if @saved_job.save
        format.html { redirect_to @saved_job, :notice => 'Saved job was successfully created.' }
        format.js
        format.json { render :json => @saved_job, :status => :created, :location => @saved_job }
      else
        format.html { render :action => "new" }
        format.json { render :json => @saved_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /saved_jobs/1
  # PUT /saved_jobs/1.json
  def update
    @saved_job = SavedJob.find(params[:id])

    respond_to do |format|
      if @saved_job.update_attributes(params[:saved_job])
        format.html { redirect_to @saved_job, :notice => 'Saved job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @saved_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_jobs/1
  # DELETE /saved_jobs/1.json
  def destroy
    @saved_job = SavedJob.find(params[:id])
    @saved_job.destroy

    respond_to do |format|
      format.html { redirect_to saved_jobs_url }
      format.json { head :no_content }
    end
  end
end
