require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品機能" do
    context '商品出品がうまくいくとき' do
      it "全ての項目が入力できている" do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
       it "imageが空だと登録できない" do
         @item.image = nil
         @item.valid?
         expect(@item.errors.full_messages).to include "Image can't be blank"
       end
      it "itemが空だと登録できない" do
        @item.item = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Item can't be blank"
      end
      it "explanationが空だと登録できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "category_idが空だと登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "category_idが空だと登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "condition_idが空だと登録できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it "charges_idが空だと登録できない" do
        @item.charges_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Charges can't be blank"
      end
      it "area_idが空だと登録できない" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end
      it "day_idが空だと登録できない" do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end
    end
  end
end