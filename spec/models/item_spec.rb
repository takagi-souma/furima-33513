require 'rails_helper'

RSpec.describe Item, type: :model do
    describe '#create' do
      before do
        @item = FactoryBot.build(:item)
      end
    end

    context '出品できない時' do
      it 'imageがない場合出品できないこと' do
        item = FactoryBot.build(:item, image: nil)
        item.image = nil
        item.valid?
        binding.pry
        expect(item.errors[:image]).to include("can't be blank")
      end

      it "nameがない場合出品できないこと" do
        item = FactoryBot.build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end

      it "infoがない場合は出品できないこと" do
        item = FactoryBot.build(:item, info: nil)
        item.valid?
        expect(item.errors[:info]).to include("can't be blank")
      end

      it "priceがない場合は出品できないこと" do
        item = FactoryBot.build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end

      it "category_idが1の場合出品ができないこと" do
        item = FactoryBot.build(:item, category_id: 1)
        item.valid?
        expect(item.errors[:category_id]).to include("Select")
      end

      it "sales_status_idが1の場合は出品できないこと" do
        item = FactoryBot.build(:item, sales_status_id: 1)
        item.valid?
        expect(item.errors[:sales_status_id]).to include("Select")
      end

      it "Shipping_fee_status_idが1の場合は出品できないこと" do
        item = FactoryBot.build(:item, shipping_fee_status_id: 1)
        item.valid?
        expect(item.errors[:shipping_fee_status_id]).to include("Select")
      end

      it "prefecture_idが1の場合は出品できないこと" do
        item = FactoryBot.build(:item,  prefecture_id: 1)
        item.valid?
        expect(item.errors[:prefecture_id]).to include("Select")
      end

      it "scheduled_delivery_idが1の場合は出品できないこと" do
        item = FactoryBot.build(:item, scheduled_delivery_id: 1) 
        item.valid?
        expect(item.errors[:scheduled_delivery_id]).to include("Select")
      end

      it "priceが300以下の場合出品できないこと" do
        item = FactoryBot.build(:item, price: "299")
        item.valid?
        expect(item.errors[:price]).to include("Out of setting rage")
      end

      it "priceが半角数字出なければ出品できないこと" do
        item = FactoryBot.build(:item, price: "あああ") 
        item.valid?
        expect(item.errors[:price]).to include("Half-width number")
      end
    end
  end
end
