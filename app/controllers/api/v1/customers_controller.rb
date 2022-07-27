class Api::V1::CustomersController < ApplicationController

  def create
    new_customer = Customer.create!(customer_params)
    render status: 201, json: CustomerSerializer.new(Customer.find(new_customer.id))
  end

  private
  def customer_params
    params.permit(:first_name, :last_name, :email, :address)
  end
end