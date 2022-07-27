require 'rails_helper'

RSpec.describe 'Customers', type: :request do

  describe 'POST Customers' do
    before :each do
      @customer_1 = create(:customer)
      post "/api/v1/customers", params: {first_name: 'Zel', last_name: 'Imbriaco', email: 'as@df.com', address: '123 Sesame Street'}
    end

    it 'Returns valid response code' do
      expect(response).to have_http_status 201
    end

    it 'Successfully creates upon post completion' do
      expect(json["data"].count).to eq (3)
      expect(json["data"]["type"]).to eq "customer"
      expect(json["data"]["attributes"].count).to eq 5
      expect(json["data"]["attributes"]["first_name"]).to eq "Zel"
      expect(json["data"]["attributes"]["subscriptions"].count).to eq 0
    end
  end
end