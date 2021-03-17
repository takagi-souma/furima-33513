class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price
  end

  with_options numericality: { other_than: 1 ,message:"Select"} do
    validates :category_id
    validates :sales_status_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :shipping_fee_status_id
  end

  validates :price, inclusion: { in: 300..9999999 ,message:"Out of setting rage"}
  validates :price, numericality: {with: /\A[0-9]+\z/, message:"Half-width number"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :scheduled_delivery


end
