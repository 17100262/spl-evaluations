class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  enum status: [:session_initiated,:completed]
end
