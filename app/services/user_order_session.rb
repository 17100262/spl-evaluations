class UserOrderSession

  def initialize(product,user)
    @product = product
    @user = user
  end

  def call
    @order = @product.orders.new(status: 'session_initiated',paid: false,user_id: @user.id)
    if @order.save!
      Adapter::StripeWrapper.new(@order,@product).session
    end
  end
end
