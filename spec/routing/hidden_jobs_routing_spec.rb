require "spec_helper"

describe HiddenJobsController do
  describe "routing" do

    it "routes to #index" do
      get("/hidden_jobs").should route_to("hidden_jobs#index")
    end

    it "routes to #new" do
      get("/hidden_jobs/new").should route_to("hidden_jobs#new")
    end

    it "routes to #show" do
      get("/hidden_jobs/1").should route_to("hidden_jobs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hidden_jobs/1/edit").should route_to("hidden_jobs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hidden_jobs").should route_to("hidden_jobs#create")
    end

    it "routes to #update" do
      put("/hidden_jobs/1").should route_to("hidden_jobs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hidden_jobs/1").should route_to("hidden_jobs#destroy", :id => "1")
    end

  end
end
