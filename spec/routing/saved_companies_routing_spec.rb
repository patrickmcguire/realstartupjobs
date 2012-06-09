require "spec_helper"

describe SavedCompaniesController do
  describe "routing" do

    it "routes to #index" do
      get("/saved_companies").should route_to("saved_companies#index")
    end

    it "routes to #new" do
      get("/saved_companies/new").should route_to("saved_companies#new")
    end

    it "routes to #show" do
      get("/saved_companies/1").should route_to("saved_companies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/saved_companies/1/edit").should route_to("saved_companies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/saved_companies").should route_to("saved_companies#create")
    end

    it "routes to #update" do
      put("/saved_companies/1").should route_to("saved_companies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/saved_companies/1").should route_to("saved_companies#destroy", :id => "1")
    end

  end
end
