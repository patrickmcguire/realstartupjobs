require "spec_helper"

describe PressMentionsController do
  describe "routing" do

    it "routes to #index" do
      get("/press_mentions").should route_to("press_mentions#index")
    end

    it "routes to #new" do
      get("/press_mentions/new").should route_to("press_mentions#new")
    end

    it "routes to #show" do
      get("/press_mentions/1").should route_to("press_mentions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/press_mentions/1/edit").should route_to("press_mentions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/press_mentions").should route_to("press_mentions#create")
    end

    it "routes to #update" do
      put("/press_mentions/1").should route_to("press_mentions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/press_mentions/1").should route_to("press_mentions#destroy", :id => "1")
    end

  end
end
