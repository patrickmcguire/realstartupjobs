class JobsTagsController < InheritedResources::Base
class JobTagsController < InheritedResources::Base
 def index
    @job_tags = JobTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @job_tags }
    end
  end

  # GET /job_tags/1
  # GET /job_tags/1.json
  def show
    @job_tag = JobTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @job_tag }
    end
  end

  # GET /job_tags/new
  # GET /job_tags/new.json
  def new
    @job_tag = JobTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @job_tag }
    end
  end

  # GET /job_tags/1/edit
  def edit
    @job_tag = JobTag.find(params[:id])
  end

  # POST /job_tags
  # POST /job_tags.json
  def create
    @job_tag = JobTag.new(params[:job_tag])

    respond_to do |format|
      if @job_tag.save
        format.html { redirect_to @job_tag, :notice => 'Hidden job was successfully created.' }
        format.json { render :json => @job_tag, :status => :created, :location => @job_tag }
      else
        format.html { render :action => "new" }
        format.json { render :json => @job_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_tags/1
  # PUT /job_tags/1.json
  def update
    @job_tag = JobTag.find(params[:id])

    respond_to do |format|
      if @job_tag.update_attributes(params[:job_tag])
        format.html { redirect_to @job_tag, :notice => 'Hidden job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @job_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_tags/1
  # DELETE /job_tags/1.json
  def destroy
    @job_tag = JobTag.find(params[:id])
    @job_tag.destroy

    respond_to do |format|
      format.html { redirect_to job_tags_url }
      format.json { head :no_content }
    end
  end
end


end
