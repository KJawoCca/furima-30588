class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :province
  belongs_to_active_hash :number_of_day
  
  belongs_to :user
  has_one_attached :image

  validates :image, :name, :text, presence: true
  validates :category, :condition, :postage, :province, :number_of_day, presence: true
  validates :category_id, :condition_id, :postage_id, :province_id, :number_of_day_id, numericality: { other_than: 1 }
end
