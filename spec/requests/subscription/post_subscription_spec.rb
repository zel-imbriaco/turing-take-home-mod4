require 'rails_helper'

RSpec.describe 'Subscriptions', type: :request do

  describe 'POST Subscriptions' do
    before :each do
      @customer_1 = create(:customer, id: 1)
      @tea_1 = create(:tea)
      post "/api/v1/subscriptions", params: {title: @tea_1.title, price: 10, status: 'Active', frequency: 'Monthly', customer_id: 1}
    end

    it 'Returns status code 201' do
      expect(response).to have_http_status 201
    end

    it 'Successfully creates a new subscription with inputted fields' do
      expect(json["data"].count).to eq 3
      expect(json["data"]["type"]).to eq "subscription"
      expect(json["data"]["attributes"].count).to eq 4
      expect(json["data"]["attributes"]["title"]).to eq @tea_1.title
      expect(json["data"]["attributes"]["price"]).to eq 10
      expect(json["data"]["attributes"]["status"]).to eq "Active"
      expect(json["data"]["attributes"]["frequency"]).to eq "Monthly"
    end
  end
end