require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品できない時' do
      it 'imageがない場合出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

      it "nameがない場合出品できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end

      it "infoがない場合は出品できないこと" do
        @item.info = nil
        @item.valid?
        expect(@item.errors[:info]).to include("can't be blank")
      end

      it "priceがない場合は出品できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it "category_idが1の場合出品ができないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include("Select")
      end

      it "sales_status_idが1の場合は出品できないこと" do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors[:sales_status_id]).to include("Select")
      end

      it "Shipping_fee_status_idが1の場合は出品できないこと" do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors[:shipping_fee_status_id]).to include("Select")
      end

      it "prefecture_idが1の場合は出品できないこと" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include("Select")
      end

      it "scheduled_delivery_idが1の場合は出品できないこと" do
        @item.sales_status_id = 1 
        @item.valid?
        expect(@item.errors[:scheduled_delivery_id]).to include("Select")
      end

      it "priceが300以下の場合出品できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include("Out of setting rage")
      end

      it "priceが全角だけでは出品できないこと" do
        @item.price = あああ
        @item.valid?
        expect(@item.errors[:price]).to include("Half-width number")
      end

      it "priceが10000000の場合出品できない"
        @item.price = 10000000
        @item.valid?
        expect(@item.errors[:price]).to include("Out of setting rage")
      end

      it "priceが半角英数混合では出品できない"
        @item.price = aa12
        @item.valid?
        expect(@item.errors[:price]).to include("Half-width number")
      end

      it "半角英語だけでは出品できない"
        @item.price = aaa
        @item.valid?
        expect(@item.errors[:price]).to include("Half-width number")
      end
    end
  end
end
