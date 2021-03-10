require 'rails_helper'
RSpec.describe Item, type: :model do
   before do
      @item = FactoryBot.build(:item)
   end

   describe '商品出品機能' do
    context '内容に問題ない場合' do
      it '正常系テスト' do
      expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "nameが空だと出品できない" do
        @item.name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "infoが空だと出品できない" do
        @item.info = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end
      it "category idが空だと出品できない" do
        @item.category_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Category is not a number"
      end
      it "status idが空だと出品できない" do
        @item.status_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Status is not a number"
      end
      it "area idが空だと出品できない" do
        @item.area_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Area is not a number"
      end
      it "delivery day id が空だと出品できない" do
        @item.delivery_day_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day is not a number"
      end
      it "delivery feeが空だと出品できない" do
        @item.delivery_fee_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee is not a number"
      end
      it "priceが空だと出品できない" do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
    end
  end
end
