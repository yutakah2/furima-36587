class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :day
  belongs_to :charges
  belongs_to :condition
  belongs_to :category
  has_one_attached :image

  with_options presence: true do
    validates :item
    validates :price
    validates :explanation
    validates :image
    validates :category_id
    validates :charges_id
    validates :condition_id
    validates :area_id
    validates :day_id
  end

  validates :day_id, :area_id, :charges_id, :condition_id, :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
end
