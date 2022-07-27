class CustomerSerializer

  def self.customer_with_subscriptions(customer)
    {
      "data": {
        "id": customer.id,
        "type": 'customer',
        "attributes": {
          "first_name": customer.first_name,
          "last_name": customer.last_name,
          "email": customer.email,
          "address": customer.address,
          "subscriptions": Subscription.where(customer_id: customer.id).all
        }
      }
    }
  end
end