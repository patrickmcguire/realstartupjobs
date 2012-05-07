class HiddenJobsController < ApplicationController
  # GET /hidden_jobs
  # GET /hidden_jobs.json
  def index
    @hidden_jobs = HiddenJob.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @hidden_jobs }
    end
  end

  # GET /hidden_jobs/1
  # GET /hidden_jobs/1.json
  def show
    @hidden_job = HiddenJob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @hidden_job }
    end
  end

  # GET /hidden_jobs/new
  # GET /hidden_jobs/new.json
  def new
    @hidden_job = HiddenJob.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @hidden_job }
    end
  end

  # GET /hidden_jobs/1/edit
  def edit
    @hidden_job = HiddenJob.find(params[:id])
  end

  # POST /hidden_jobs
  # POST /hidden_jobs.json
  def create
    @hidden_job = HiddenJob.new(params[:hidden_job])

    respond_to do |format|
      if @hidden_job.save
        format.html { redirect_to @hidden_job, :notice => 'Hidden job was successfully created.' }
        format.json { render :json => @hidden_job, :status => :created, :location => @hidden_job }
      else
        format.html { render :action => "new" }
        format.json { render :json => @hidden_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hidden_jobs/1
  # PUT /hidden_jobs/1.json
  def update
    @hidden_job = HiddenJob.find(params[:id])

    respond_to do |format|
      if @hidden_job.update_attributes(params[:hidden_job])
        format.html { redirect_to @hidden_job, :notice => 'Hidden job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @hidden_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hidden_jobs/1
  # DELETE /hidden_jobs/1.json
  def destroy
    @hidden_job = HiddenJob.find(params[:id])
    @hidden_job.destroy

    respond_to do |format|
      format.html { redirect_to hidden_jobs_url }
      format.json { head :no_content }
    end
  end
end
