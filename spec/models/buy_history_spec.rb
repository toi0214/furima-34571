require 'rails_helper'
RSpec.describe BuyHistory, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @buy_history = FactoryBot.build(:buy_history, user_id: @user.id, item_id: @item.id)
    sleep 1
  end

  describe '商品購入機能' do
    context '内容に問題ない場合' do
      it '正常系テスト' do
        expect(@buy_history).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "postal_codeが空だと登録できない" do
        @buy_history.postal_code = ' '
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Postal code can't be blank" 
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

      it "tokenが空だと登録できない" do
        @buy_history.token = ' '
        @buy_history.valid?
        expect(@buy_history.errors.full_messages).to include "Token can't be blank" 
      end
    end
  end
end