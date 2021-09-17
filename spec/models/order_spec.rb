require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:orser)
  end
  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it '全ての項目が入力できている' do
        expect(@user).to be_valid
      end
end
