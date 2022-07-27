class Api::V1::SubscriptionsController < ApplicationController
  def create
    new_subscription = Subscription.create!(subscription_params)
    render status: 201, json: SubscriptionSerializer.new(Subscription.find(new_subscription.id))
  end

  def destroy
    Subscription.destroy(params[:id])
  end

  private
  def subscription_params
    params.permit(:title, :price, :status, :frequency, :customer_id)
  end
end