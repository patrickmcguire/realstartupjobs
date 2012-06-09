class UserIdsController < ApplicationController
  # GET /user_ids
  # GET /user_ids.json
  def index
    @user_ids = UserId.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_ids }
    end
  end

  # GET /user_ids/1
  # GET /user_ids/1.json
  def show
    @user_id = UserId.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_id }
    end
  end

  # GET /user_ids/new
  # GET /user_ids/new.json
  def new
    @user_id = UserId.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_id }
    end
  end

  # GET /user_ids/1/edit
  def edit
    @user_id = UserId.find(params[:id])
  end

  # POST /user_ids
  # POST /user_ids.json
  def create
    @user_id = UserId.new(params[:user_id])

    respond_to do |format|
      if @user_id.save
        format.html { redirect_to @user_id, notice: 'User was successfully created.' }
        format.json { render json: @user_id, status: :created, location: @user_id }
      else
        format.html { render action: "new" }
        format.json { render json: @user_id.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_ids/1
  # PUT /user_ids/1.json
  def update
    @user_id = UserId.find(params[:id])

    respond_to do |format|
      if @user_id.update_attributes(params[:user_id])
        format.html { redirect_to @user_id, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_id.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_ids/1
  # DELETE /user_ids/1.json
  def destroy
    @user_id = UserId.find(params[:id])
    @user_id.destroy

    respond_to do |format|
      format.html { redirect_to user_ids_url }
      format.json { head :no_content }
    end
  end
end
