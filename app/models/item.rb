class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :day
  belongs_to :charges
  belongs_to :condition
  belongs_to :category
  has_one_attached :image

  validates :day_id, :area_id, :charges_id, :condition_id, :category_id, numericality: { other_than: 1 , message: "can't be blank"}
end
