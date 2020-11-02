require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:order)
    end

    it "配送先住所情報などの必要項目が全て正常に入力されていて、tokenが正しく取得できていれば購入できること" do
      expect(@order).to be_valid
    end
    
    it "配送先住所情報として郵便番号が必須であること" do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank") 
    end
        
    it "配送先住所情報として都道府県が必須であること" do
      @order.province_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Province must be other than 1") 
    end
        
    it "配送先住所情報として市町村が必須であること" do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank") 
    end
        
    it "配送先住所情報として番地が必須であること" do
      @order.address_line1 = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address line1 can't be blank") 
    end
        
    it "配送先住所情報として電話番号が必須であること" do
      @order.tel = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Tel can't be blank") 
    end
    
    it "郵便番号は半角数字3桁、ハイフン、半角数字4桁の並びであること" do
      @order.postal_code = "1231234"
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code を入力してください") 
    end
        
    it "電話番号はハイフン不要であること" do
      @order.tel = "123-1234-12"
      @order.valid?
      expect(@order.errors.full_messages).to include("Tel を入力してください（ハイフンは入力しないでください）") 
    end
            
    it "電話番号は半角数字11桁であること" do
      @order.tel = "123123412345"
      @order.valid?
      expect(@order.errors.full_messages).to include("Tel を入力してください（ハイフンは入力しないでください）") 
    end

    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
