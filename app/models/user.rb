class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy

  def full_name
    [firstname,lastname].join(' ')
  end

  def order_count
    orders.count
  end
  
end