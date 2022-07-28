class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :status, :frequency

  def self.active_and_cancelled(customer)
  subscriptions = []
  Subscription.where(customer_id: customer).all.each { |subscription| 
    if subscription.status == "Active" || subscription.status == "Cancelled" 
      subscriptions << SubscriptionSerializer.new(subscription)
    end
  }
  subscriptions
  end
end