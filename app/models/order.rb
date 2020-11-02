class Order

  include ActiveModel::Model
  attr_accessor :postal_code, :address_line1, :address_line2, :city, :province_id, :tel, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
    validates :tel, format: { with: /\A\d{11}\z/, message: 'を入力してください（ハイフンは入力しないでください）' }
    validates :address_line1, :city, :token
  end
  validates :province_id, numericality: { other_than: 1 }

  def save
    user = User.find(user_id)
    item = Item.find(item_id)
    purchase = Purchase.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, address_line1: address_line1, address_line2: address_line2, city: city, province_id: province_id, tel: tel, purchase_id: purchase.id)
  end
end