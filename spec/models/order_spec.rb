require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての項目が入力できている' do
        expect(@user).to be_valid
      endpending "add some examples to (or delete) #{__FILE__}"
end
