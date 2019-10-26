module Adapter
  class StripeWrapper
    include Rails.application.routes.url_helpers
    attr_accessor :order, :product, :session

    def initialize(order, product)
      @session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          client_reference_id: order.id,
          line_items: [{
              name: product.name,
              # description: 'Comfortable cotton t-shirt',
              # images: ['https://example.com/t-shirt.png'],
              amount: (product.price * 100).to_i,
              currency: 'usd',
              quantity: 1,
          }],
          success_url: orders_url({checkout: 'success'}),
          cancel_url: products_url({checkout: 'failure'}),
      )
    end
  end
end
