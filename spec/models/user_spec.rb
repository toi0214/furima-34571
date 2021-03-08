require 'rails_helper'
RSpec.describe User, type: :model do
   before do
      @user = FactoryBot.build(:user)
   end

   describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank" 
    end
    it "emailが空では登録できない" do
      @user.email = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "パスワードが空では登録できない" do
      @user.password = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "確認用パスワードが空では登録できない" do
      @user.password_confirmation = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "苗字が空だと登録できない" do
      @user.first_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "名前が空だと登録できない" do
      @user.second_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Second name can't be blank"
    end
    it "読み仮名が空だと登録できない" do
      @user.given_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Given name can't be blank"
    end
    it "ヨミガナが空だと登録できない" do
      @user.last_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "誕生日が空だと登録できない" do
      @user.birthday_id = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
