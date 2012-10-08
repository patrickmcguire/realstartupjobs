require "spec_helper"

describe PressesController do
  describe "routing" do

    it "routes to #index" do
      get("/presses").should route_to("presses#index")
    end

    it "routes to #new" do
      get("/presses/new").should route_to("presses#new")
    end

    it "routes to #show" do
      get("/presses/1").should route_to("presses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/presses/1/edit").should route_to("presses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/presses").should route_to("presses#create")
    end

    it "routes to #update" do
      put("/presses/1").should route_to("presses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/presses/1").should route_to("presses#destroy", :id => "1")
    end

  end
end
