class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_cord, :city, :address, :building, :phone_number, :prefecture_id, :token

  with_options presence: true do
    validates :postal_cord
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :postal_cord, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id, numericality: { other_than: 1 ,message:"Select"}
  validates :phone_number,  length: {maximum: 11}
  validates :phone_number,  numericality:

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_cord: postal_cord, city: city, address: address, building: building, phone_number: phone_number, prefecture_id: prefecture_id, order_id: order.id)
  end
end
