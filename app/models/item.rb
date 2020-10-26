class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :province
  belongs_to_active_hash :number_of_day

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image, :name, :text, :category, :condition, :postage, :province, :number_of_day
  end
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id, :condition_id, :postage_id, :province_id, :number_of_day_id, numericality: { other_than: 1 }
end
