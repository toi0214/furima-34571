require 'rails_helper'
RSpec.describe BuyHistory, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @buy_history = FactoryBot.build(:buy_history, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '内容に問題ない場合' do
      it '正常系テスト' do
        expect(@buy_history).to be_valid
      end

      it '建物名が空でも保存できる' do
        @buy_history.building_name = ' '
        expect(@buy_history).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "postal_codeが空だと登録できない" do
        @buy_history.postal_code = ' '
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Postal code can't be blank" 
      end

      it "postal_codeがハイフンなしだと登録できない" do
        @buy_history.postal_code = '0001111'
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Postal code is invalid" 
      end

      it "area_idが1だと登録できない" do
        @buy_history.area_id = 1
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Area must be other than 1" 
      end

      it "municipalityが空だと登録できない" do
        @buy_history.municipality = ' '
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Municipality can't be blank" 
      end

      it "addressが空だと登録できない" do
        @buy_history.address = ' '
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Address can't be blank" 
      end

      it "phone_numberが空だと登録できない" do
        @buy_history.phone_number = ' '
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Phone number can't be blank" 
      end

      it "phone_numberが12桁以上だと登録できない" do
        @buy_history.phone_number = '1234567891234'
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Phone number is too long (maximum is 12 characters)" 
      end

      it "phone_numberが英数混合だと登録できない" do
        @buy_history.phone_number = '1111111111a'
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Phone number is not a number" 
      end

      it "tokenが空だと登録できない" do
        @buy_history.token = ' '
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Token can't be blank" 
      end

      it "user_idが空だと登録できない" do
        @buy_history.user_id = ' '
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "User can't be blank" 
      end

      it "item_idが空だと登録できない" do
        @buy_history.item_id = ' '
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Item can't be blank" 
      end
    end
  end
end