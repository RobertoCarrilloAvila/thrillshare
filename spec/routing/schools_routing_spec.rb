require "rails_helper"

RSpec.describe SchoolsController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(post: "/v1/schools").to route_to("schools#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/v1/schools/1").to route_to("schools#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/v1/schools/1").to route_to("schools#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/v1/schools/1").to route_to("schools#destroy", id: "1")
    end
    
  end
end
