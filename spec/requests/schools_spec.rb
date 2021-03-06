require 'rails_helper'
require 'devise/jwt/test_helpers'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/schools", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # School. As you add validations to School, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:school, address: attributes_for(:address))
  }

  let(:invalid_attributes) {
    attributes_for(:school, address: attributes_for(:address, address_id: 1))
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # SchoolsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    Devise::JWT::TestHelpers.auth_headers({}, create(:user))
  }

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new School" do
        expect {
          post schools_url,
               params: { school: valid_attributes }, headers: valid_headers, as: :json
        }.to change(School, :count).by(1)
      end

      it "renders a JSON response with the new school" do
        post schools_url,
             params: { school: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new School" do
        expect {
          post schools_url,
               params: { school: invalid_attributes }, as: :json
        }.to change(School, :count).by(0)
      end

      it "renders a JSON response with errors for the new school" do
        post schools_url,
             params: { school: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: "test_name"
        }
      }

      it "updates the requested school" do
        school = create(:school)
        patch school_url(school),
              params: { school: new_attributes }, headers: valid_headers, as: :json
        expect(school.reload.name).to eq("test_name")
        # skip("Add assertions for updated state")
      end

      it "renders a JSON response with the school" do
        school = create(:school)
        patch school_url(school),
              params: { school: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the school" do
        school = create(:school)
        patch school_url(school),
              params: { school: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested school" do
      school = create(:school)
      expect {
        delete school_url(school), headers: valid_headers, as: :json
      }.to change(School, :count).by(-1)
    end
  end
end
