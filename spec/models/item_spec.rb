require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    it "商品画像、商品名、商品の説明、価格の設定ほか必要項目が全て入力されていれば出品できること" do
      expect(@item).to be_valid
    end
    it "商品画像を1枚つけることが必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が必須であること" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が必須であること" do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it "カテゴリーの情報が必須であること" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "商品の状態についての情報が必須であること" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it "配送料の負担についての情報が必須であること" do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end
    it "発送元の地域についての情報が必須であること" do
      @item.province_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Province must be other than 1")
    end
    it "発送までの日数についての情報が必須であること" do
      @item.number_of_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Number of day must be other than 1")
    end
    it "価格についての情報が必須であること" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "価格の範囲が、¥300~¥9,999,999の間であること" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it "販売価格は半角数字のみ保存可能であること" do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
