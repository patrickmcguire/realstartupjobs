require "spec_helper"

describe SavedJobsController do
  describe "routing" do

    it "routes to #index" do
      get("/saved_jobs").should route_to("saved_jobs#index")
    end

    it "routes to #new" do
      get("/saved_jobs/new").should route_to("saved_jobs#new")
    end

    it "routes to #show" do
      get("/saved_jobs/1").should route_to("saved_jobs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/saved_jobs/1/edit").should route_to("saved_jobs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/saved_jobs").should route_to("saved_jobs#create")
    end

    it "routes to #update" do
      put("/saved_jobs/1").should route_to("saved_jobs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/saved_jobs/1").should route_to("saved_jobs#destroy", :id => "1")
    end

  end
end
