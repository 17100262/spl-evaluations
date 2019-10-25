class OrderGenerator
  
  def self.generate_order(user, product)
    user_id = user.id
    @product = product
    @product.orders.new(status: 'session_initiated', paid: false, user_id: user_id)
  end

end