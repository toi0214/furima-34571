require 'rails_helper'
RSpec.describe User, type: :model do
   before do
      @user = FactoryBot.build(:user)
   end

   describe 'ユーザー新規登録' do
    context '内容に問題ない場合' do
      it '正常系テスト' do
      expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
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
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英語のみは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが数字のみは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが全角英数混合登録できない' do
        @user.password = ''
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password には英字と数字の両方を含めて設定してください", "Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it '姓が全角以外は登録できない' do
        @user.first_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it '名が全角以外は登録できない' do
        @user.second_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Second name 全角文字を使用してください')
      end
      it '姓（フリガナ）全角カタカナ以外登録できない' do
        @user.given_name = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('Given name 全角文字を使用してください')
      end
      it '名（フリガナ）全角カタカナ以外登録できない' do
        @user.last_name = '太朗'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
        
    end
  end
end
