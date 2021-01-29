require "rails_helper"

RSpec.describe RecipientsController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(get: "/v1/recipients/1").to route_to("recipients#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/v1/recipients").to route_to("recipients#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/v1/recipients/1").to route_to("recipients#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/v1/recipients/1").to route_to("recipients#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/v1/recipients/1").to route_to("recipients#destroy", id: "1")
    end
  end
end
