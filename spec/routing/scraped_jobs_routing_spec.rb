require "spec_helper"

describe ScrapedJobsController do
  describe "routing" do

    it "routes to #index" do
      get("/scraped_jobs").should route_to("scraped_jobs#index")
    end

    it "routes to #new" do
      get("/scraped_jobs/new").should route_to("scraped_jobs#new")
    end

    it "routes to #show" do
      get("/scraped_jobs/1").should route_to("scraped_jobs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/scraped_jobs/1/edit").should route_to("scraped_jobs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/scraped_jobs").should route_to("scraped_jobs#create")
    end

    it "routes to #update" do
      put("/scraped_jobs/1").should route_to("scraped_jobs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/scraped_jobs/1").should route_to("scraped_jobs#destroy", :id => "1")
    end

  end
end
