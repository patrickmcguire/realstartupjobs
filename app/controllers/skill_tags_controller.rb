class SkillTagsController < InheritedResources::Base
 def index
    @skill_tags = SkillTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @skill_tags }
    end
  end

  # GET /skill_tags/1
  # GET /skill_tags/1.json
  def show
    @skill_tag = SkillTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @skill_tag }
    end
  end

  # GET /skill_tags/new
  # GET /skill_tags/new.json
  def new
    @skill_tag = SkillTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @skill_tag }
    end
  end

  # GET /skill_tags/1/edit
  def edit
    @skill_tag = SkillTag.find(params[:id])
  end

  # POST /skill_tags
  # POST /skill_tags.json
  def create
    @skill_tag = SkillTag.new(params[:skill_tag])

    respond_to do |format|
      if @skill_tag.save
        format.html { redirect_to @skill_tag, :notice => 'Hidden job was successfully created.' }
        format.json { render :json => @skill_tag, :status => :created, :location => @skill_tag }
      else
        format.html { render :action => "new" }
        format.json { render :json => @skill_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /skill_tags/1
  # PUT /skill_tags/1.json
  def update
    @skill_tag = SkillTag.find(params[:id])

    respond_to do |format|
      if @skill_tag.update_attributes(params[:skill_tag])
        format.html { redirect_to @skill_tag, :notice => 'Hidden job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @skill_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /skill_tags/1
  # DELETE /skill_tags/1.json
  def destroy
    @skill_tag = SkillTag.find(params[:id])
    @skill_tag.destroy

    respond_to do |format|
      format.html { redirect_to skill_tags_url }
      format.json { head :no_content }
    end
  end
end
