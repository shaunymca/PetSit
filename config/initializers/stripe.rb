Stripe.api_key = ENV["sk_test_3xQZmbsT7bUzMSif7klcymHh"]
STRIPE_PUBLIC_KEY = ENV["pk_test_CKlUzyGoXz6ztht2JcSs1Ex7"]

StripeEvent.setup do
  subscribe 'customer.subscription.deleted' do |event|
    user = User.find_by_customer_id(event.data.object.customer)
    user.expire
  end
end