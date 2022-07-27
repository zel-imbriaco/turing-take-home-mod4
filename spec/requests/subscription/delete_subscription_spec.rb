require 'rails_helper'

RSpec.describe 'Subscriptions', type: :request do

  describe 'DELETE Subscriptions' do
    before :each do
      @customer_1 = create(:customer, id: 1)
      @subscription_1 = create(:subscription, id: 6, customer_id: 1, status: "Active")
      @subscription_2 = create(:subscription, id: 19, customer_id: 1, status: "Cancelled")
      delete "/api/v1/subscriptions/19"
    end

    it 'Returns successful status code' do
      expect(response).to have_http_status 204
    end

    it 'Successfully deletes subscription from database' do
      get '/api/v1/customers/1'
      expect(json["data"]["attributes"]["subscriptions"].count).to eq 1
    end
  end
end