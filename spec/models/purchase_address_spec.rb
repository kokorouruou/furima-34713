require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入の保存' do
    before do 
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

      context '商品購入の保存ができるとき' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@purchase_address).to be_valid
        end
        it 'building_nameは空でも保存できること' do
          @purchase_address.building_name = ''
          expect(@purchase_address).to be_valid
        end
      end

      context '商品購入の保存ができないとき' do
        it 'postal_codeが空だと保存できないこと' do
          @purchase_address.postal_code = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
          @purchase_address.postal_code = '1234567'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
        end
        it 'prefectureを選択していないと保存できないこと' do
          @purchase_address.prefecture_id = 1
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
        end
        it 'cityが空だと保存できないこと' do
          @purchase_address.city = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("City can't be blank")
        end
        it 'house_numberは空だと保存できないこと' do
          @purchase_address.house_number = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
        end
        it 'phone_numberは空だと保存できないこと' do
          @purchase_address.phone_number = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberは半角数字のみでないと保存できないこと' do
          @purchase_address.phone_number = '０９０１２３４５６７８'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Phone number input only number')
        end
        it 'phone_numberは半角英数字混合だと保存できないこと' do
        @purchase_address.phone_number = '090aaaabbbb'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number input only number')
        end
        it 'phone_numberは12桁以上だと保存できないこと' do
          @purchase_address.phone_number = '090123456789'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Phone number input only number')
          end
        it "tokenが空では登録できないこと" do
          @purchase_address.token = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        end
          it 'user_idが空では保存できないこと' do
          @purchase_address.user_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空では保存できないこと' do
          @purchase_address.item_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
        end
      end
  end
end
