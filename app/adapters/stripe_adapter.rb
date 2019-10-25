class StripeAdapter
  
  def initialize(product, order)
    @product = product
    @order = order
  end

  def make_session
    Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      client_reference_id: @order.id,
      line_items: [{
        name: @product.name,
        # description: 'Comfortable cotton t-shirt',
        # images: ['https://example.com/t-shirt.png'],
        amount: (@product.price * 100).to_i,
        currency: 'usd',
        quantity: 1,
      }],
      success_url: "http://localhost:3000/orders?checkout=success",
      cancel_url: "http://localhost:3000/products?checkout=failure",
    )
  end

end