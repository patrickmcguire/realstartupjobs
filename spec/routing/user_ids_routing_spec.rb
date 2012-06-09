require "spec_helper"

describe UserIdsController do
  describe "routing" do

    it "routes to #index" do
      get("/user_ids").should route_to("user_ids#index")
    end

    it "routes to #new" do
      get("/user_ids/new").should route_to("user_ids#new")
    end

    it "routes to #show" do
      get("/user_ids/1").should route_to("user_ids#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_ids/1/edit").should route_to("user_ids#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_ids").should route_to("user_ids#create")
    end

    it "routes to #update" do
      put("/user_ids/1").should route_to("user_ids#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_ids/1").should route_to("user_ids#destroy", :id => "1")
    end

  end
end
