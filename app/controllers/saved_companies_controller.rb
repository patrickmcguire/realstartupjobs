class SavedCompaniesController < ApplicationController
  # GET /saved_companies
  # GET /saved_companies.json
  def index
    @saved_companies = SavedCompany.where(:user_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @saved_companies }
    end
  end

  # GET /saved_companies/1
  # GET /saved_companies/1.json
  def show
    @saved_company = SavedCompany.find(params[:id])
    @company = Company.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @saved_company }
    end
  end

  # GET /saved_companies/new
  # GET /saved_companies/new.json
  def new
    @saved_company = SavedCompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @saved_company }
    end
  end

  # GET /saved_companies/1/edit
  def edit
    @saved_company = SavedCompany.find(params[:id])
  end

  # POST /saved_companies
  # POST /saved_companies.json
  def create
    @saved_company = SavedCompany.new(params[:saved_company])

    respond_to do |format|
      if @saved_company.save
        format.html { redirect_to @saved_company, notice: 'Saved company was successfully created.' }
        format.json { render json: @saved_company, status: :created, location: @saved_company }
      else
        format.html { render action: "new" }
        format.json { render json: @saved_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /saved_companies/1
  # PUT /saved_companies/1.json
  def update
    @saved_company = SavedCompany.find(params[:id])

    respond_to do |format|
      if @saved_company.update_attributes(params[:saved_company])
        format.html { redirect_to @saved_company, notice: 'Saved company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @saved_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_companies/1
  # DELETE /saved_companies/1.json
  def destroy
    @saved_company = SavedCompany.find(params[:id])
    @saved_company.destroy

    respond_to do |format|
      format.html { redirect_to saved_companies_url }
      format.json { head :no_content }
    end
  end
end
