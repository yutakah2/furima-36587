require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it '全ての項目が入力できている' do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'itemが空だと登録できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item can't be blank"
      end
      it 'explanationが空だと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'category_idが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが空だと登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'charges_idが空だと登録できない' do
        @item.charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Charges can't be blank"
      end
      it 'area_idが空だと登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it 'day_idが空だと登録できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = Category.find_by(name: '---').id
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = Condition.find_by(name: '---').id
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.charges_id = Charges.find_by(name: '---').id
        @item.valid?
        expect(@item.errors.full_messages).to include "Charges can't be blank"
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.area_id = Area.find_by(name: '---').id
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.day_id = Day.find_by(name: '---').id
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end
      it '半角数字以外が含まれている場合は出品できない' do
        @item.price = '111aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it '価格が300円未満では出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
