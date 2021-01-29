require "rails_helper"

RSpec.describe OrdersController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(get: "/v1/orders/1").to route_to("orders#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/v1/orders").to route_to("orders#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/v1/orders/1").to route_to("orders#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/v1/orders/1").to route_to("orders#update", id: "1")
    end

    it "routes to #cancel" do
      expect(post: "/v1/orders/1/cancel").to route_to("orders#cancel", id: "1")
    end
  end
end
