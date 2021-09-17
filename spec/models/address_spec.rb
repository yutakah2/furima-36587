require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it '全ての項目が入力できている' do
        expect(@address).to be_valid
      end
end
