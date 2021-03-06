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

RSpec.describe "/recipients", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Recipient. As you add validations to Recipient, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:recipient, address: attributes_for(:address),
                                order_id: create(:order).id).slice(:name, :last_name, :email, :address, :order_id)
  }

  let(:invalid_attributes) {
    attributes_for(:recipient, order_id: nil).slice(:name, :last_name, :email, :order_id)
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # RecipientsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    Devise::JWT::TestHelpers.auth_headers({}, create(:user))
  }

  describe "GET /show" do
    it "renders a successful response" do
      recipient = create(:recipient)
      get recipient_url(recipient), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Recipient" do
        expect {
          post recipients_url,
               params: { recipient: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Recipient, :count).by(1)
      end

      it "renders a JSON response with the new recipient" do
        post recipients_url,
             params: { recipient: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Recipient" do
        expect {
          post recipients_url,
               params: { recipient: invalid_attributes }, as: :json
        }.to change(Recipient, :count).by(0)
      end

      it "renders a JSON response with errors for the new recipient" do
        post recipients_url,
             params: { recipient: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested recipient" do
        recipient = create(:recipient)
        patch recipient_url(recipient),
              params: { recipient: invalid_attributes.slice(:name, :last_name, :email) }, headers: valid_headers, as: :json
        recipient.reload
        expect(recipient.name).to eq(invalid_attributes[:name])
        expect(recipient.last_name).to eq(invalid_attributes[:last_name])
        expect(recipient.email).to eq(invalid_attributes[:email])
      end

      it "renders a JSON response with the recipient" do
        recipient = create(:recipient)
        patch recipient_url(recipient),
              params: { recipient: invalid_attributes.slice(:name, :last_name, :email) }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the recipient" do
        recipient = create(:recipient)
        patch recipient_url(recipient),
              params: { recipient: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested recipient" do
      recipient = create(:recipient)
      expect {
        delete recipient_url(recipient), headers: valid_headers, as: :json
      }.to change(Recipient, :count).by(-1)
    end
  end
end
