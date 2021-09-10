require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context '新規登録がうまくいくとき' do
      it "全ての項目が入力できている" do
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "emailが一意性でないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end 
      it "emailが@を含まないと登録できない" do
        @user.email = "hogehuga.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが6文字以上でないと登録できない" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordが半角英数字混合でないと登録できない" do
        @user.password = "aaa111"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "passwordとpassword（確認）は、値が一致しないと登録できない" do
        @user = User.new(email: 'test@test.com', password: 'hogehoge', password_confirmation: 'hoge')
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "nameが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank", "First name 全角文字を使用してください"
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank", "Last name 全角文字を使用してください"
      end
      it "first_nameは全角（漢字・ひらがな・カタカナ）での入力じゃないと登録できない" do
        @user.first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
      end
      it "last_nameは全角（漢字・ひらがな・カタカナ）での入力じゃないと登録できない" do
        @user.last_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
      end
      it "first_name_kanaは全角（カタカナ）での入力じゃないと登録できない" do
        @user.first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
      end
      it "last_name_kanaは全角（カタカナ）での入力じゃないと登録できない" do
        @user.last_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
      end
      it "生年月日が空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        binding.pry
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end