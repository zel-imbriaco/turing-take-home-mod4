require 'rails_helper'

RSpec.describe 'Customer', type: :request do

  describe 'GET Customer' do
    before :each do
      @customer_1 = create(:customer, id: 1)
      @subscription_1 = create(:subscription, id: 6, customer_id: 1, status: "Active")
      @subscription_2 = create(:subscription, id: 19, customer_id: 1, status: "Cancelled")
      get '/api/v1/customers/1'
    end

    it "Returns 200 status code" do
      expect(response).to have_http_status 200
    end

    it 'Returns the customer with a list of their subscriptions' do
      expect(json["data"].count).to eq 3
      expect(json["data"]["type"]).to eq "customer"
      expect(json["data"]["attributes"].count).to eq 5
      expect(json["data"]["attributes"]["first_name"]).to eq @customer_1.first_name
      expect(json["data"]["attributes"]["last_name"]).to eq @customer_1.last_name
      expect(json["data"]["attributes"]["email"]).to eq @customer_1.email
      expect(json["data"]["attributes"]["address"]).to eq @customer_1.address
      expect(json["data"]["attributes"]["subscriptions"].count).to eq 2
    end
  end
end