require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
    context '商品購入がうまくいくとき' do
      it '全ての項目が入力できている' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'codeが空だと登録できない' do
        @order_address.code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Code can't be blank"
      end
      it 'codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.code = 1234567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Code is invalid. Include hyphen(-)"
      end
      it 'area_idが空だと登録できない' do
        @order_address.area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Area can't be blank"
      end
      it 'municipalityが空だと登録できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'addressが空だと登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Address can't be blank"
      end
      it 'telephoneが空だと登録できない' do
        @order_address.telephone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Telephone can't be blank"
      end
      it '電話番号は、10桁以上11桁以内の半角数値でないと保存できない' do
        @order_address.telephone = 190123456789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Telephone is invalid"
      end
      it 'userが紐付いていないと登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていないと登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
      it "tokenが空では登録できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end