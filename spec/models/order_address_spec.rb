require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user, item_id: @item)
    end
    context '購入できる時' do
      it "全ての項目の入力が存在すれば購入できること" do
        expect(@order_address).to be_valid
      end
    end
      
    context '購入できない時' do
      it "postal_cordが空だと購入できない" do
        @order_address.postal_cord = nil
        @order_address.valid?
        expect(@order_address.errors[:postal_cord]).to include("can't be blank")
      end

      it "postal_cordが半角ハイフンをを含んだ正しい形式でないと購入できない" do
        @order_address.postal_cord = "aaa"
        @order_address.valid?
        expect(@order_address.errors[:postal_cord]).to include()
      end

      it "cityが空だと購入できない" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors[:city]).to include("can't be blank")
      end

      it "addressが空だと購入できない" do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors[:address]).to include("can't be blank")
      end

      it "phone_numberが空だと購入できない" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include("can't be blank")
      end

      it "prefecture_idが1だと購入できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors[:prefecture_id]).to include("Select")
      end

      it "tokenが空だと購入できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors[:token]).to include("can't be blank")
      end
    end
  end
end
