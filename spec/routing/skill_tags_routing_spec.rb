require "spec_helper"

describe SkillTagsController do
  describe "routing" do

    it "routes to #index" do
      get("/skill_tags").should route_to("skill_tags#index")
    end

    it "routes to #new" do
      get("/skill_tags/new").should route_to("skill_tags#new")
    end

    it "routes to #show" do
      get("/skill_tags/1").should route_to("skill_tags#show", :id => "1")
    end

    it "routes to #edit" do
      get("/skill_tags/1/edit").should route_to("skill_tags#edit", :id => "1")
    end

    it "routes to #create" do
      post("/skill_tags").should route_to("skill_tags#create")
    end

    it "routes to #update" do
      put("/skill_tags/1").should route_to("skill_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/skill_tags/1").should route_to("skill_tags#destroy", :id => "1")
    end

  end
end
