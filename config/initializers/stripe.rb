Rails.configuration.stripe = {
  :publishable_key => 'pk_test_MGR9wa0izeFDRRyYpJ403SyS',

  :secret_key      => 'sk_test_NTn00F28ffZxAzk6XvSTAPXD'

}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
