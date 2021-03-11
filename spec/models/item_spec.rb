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
      it "category idが1だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it "status idが1だと出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end
      it "area idが1だと出品できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area must be other than 1"
      end
      it "delivery day id が1だと出品できない" do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day must be other than 1"
      end
      it "delivery feeが1だと出品できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee must be other than 1"
      end
      it "priceが空だと出品できない" do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "priceに数字以外が混じっていると出品できない" do
        @item.price = 'aあ'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "priceが全角数字だと出品できない" do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "priceが下限の金額以下だと出品できない" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "priceが上限の金額以上だと出品できない" do
        @item.price = 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
    end
  end
end
