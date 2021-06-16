require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の保存' do
    context "商品出品が保存できる場合" do
      it '全ての入力が正しく入力されていること' do
        expect(@item).to be_valid
      end
    end

    context "商品出品が保存できない場合" do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態についての情報が必須であること' do
        @item.product_condition_id =  "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition must be other than 1")
      end
      it '配送料の負担についての情報が必須であること' do
        @item.delivery_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '発送までの日数についての情報が必須であること' do
        @item.day_to_ship_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship must be other than 1")
      end
      it '販売価格についての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '半角英数混合では登録できないこと' do
        @item.price = 'abc123'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '半角英語だけでは登録できないこと' do
        @item.price = 'abcdef'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'ユーザーが紐づいていないと保存できないこと' do
        @item.user_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end
    end
  end

end
