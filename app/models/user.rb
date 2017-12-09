class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates_length_of :password, :minimum => 7

  def previous_orders
    self.orders.where(status: 2).includes(order_items: :product)
  end
end
