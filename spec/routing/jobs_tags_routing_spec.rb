require "spec_helper"

describe JobsTagsController do
  describe "routing" do

    it "routes to #index" do
      get("/jobs_tags").should route_to("jobs_tags#index")
    end

    it "routes to #new" do
      get("/jobs_tags/new").should route_to("jobs_tags#new")
    end

    it "routes to #show" do
      get("/jobs_tags/1").should route_to("jobs_tags#show", :id => "1")
    end

    it "routes to #edit" do
      get("/jobs_tags/1/edit").should route_to("jobs_tags#edit", :id => "1")
    end

    it "routes to #create" do
      post("/jobs_tags").should route_to("jobs_tags#create")
    end

    it "routes to #update" do
      put("/jobs_tags/1").should route_to("jobs_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/jobs_tags/1").should route_to("jobs_tags#destroy", :id => "1")
    end

  end
end
