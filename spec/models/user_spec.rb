require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context '登録できる時' do
      it '全ての項目の入力が存在すれば登録できること' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end

    context '登録できない時' do
      it 'nicknameがない場合は登録できないこと' do
        user = FactoryBot.build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end

      it "emailがない場合は登録できないこと" do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it "passwordがない場合は登録できないこと" do
        user = FactoryBot.build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it "last_nameがない場合は登録できないこと" do
        user = FactoryBot.build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include("can't be blank")
      end

      it "last_name_kanaがない場合は登録できないこと" do
        user = FactoryBot.build(:user, last_name_kana: nil)
        user.valid?
        expect(user.errors[:last_name_kana]).to include("can't be blank")
      end

      it "first_nameがない場合は登録できないこと" do
        user = FactoryBot.build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end

      it "first_name_kanaがない場合は登録できないこと" do
        user = FactoryBot.build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include("can't be blank")
      end

      it "birth_dateがない場合は登録できないこと" do
        user = FactoryBot.build(:user, birth_date: nil)
        user.valid?
        expect(user.errors[:birth_date]).to include("can't be blank")
      end

      it "重複したemailが存在する場合登録できないこと" do
        user = FactoryBot.create(:user) 
        another_user = FactoryBot.build(:user, email: user.email) 
        another_user.valid? 
        expect(another_user.errors[:email]).to include("has already been taken")
      end

      it "emailが＠を含まなければ登録できないこと" do
        user = FactoryBot.build(:user, email: "testgmail")
        user.valid?
        expect(user.errors[:email]).to include("is invalid")
      end

      it "passwordが6文字以下であれば登録できないこと" do
        user = FactoryBot.build(:user, password: "123ab", password: "123ab") 
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end

      it 'last_nameが全角入力でなければ登録できないこと' do
        user = FactoryBot.build(:user, last_name: "ｱｲｳｴｵ") 
        user.valid?
        expect(user.errors[:last_name]).to include("Full-width characters")
      end

      it 'first_nameが全角入力でなければ登録できないこと' do
        user = FactoryBot.build(:user, first_name: "ｱｲｳｴｵ") 
        user.valid?
        expect(user.errors[:first_name]).to include("Full-width characters")
      end

      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        user = FactoryBot.build(:user, last_name_kana: "あいうえお") 
        user.valid?
        expect(user.errors[:last_name_kana]).to include("Full-width katakana characters")
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        user = FactoryBot.build(:user, first_name_kana: "あいうえお") 
        user.valid?
        expect(user.errors[:first_name_kana]).to include("Full-width katakana characters")
      end

      it 'passwordが英語のみでは登録できないこと' do
        user = FactoryBot.build(:user, password: "abcdef")
        user.valid?
        expect(user.errors[:password]).to include("Include both letters and numbers")
      end
      
      it 'passwordが数字のみでは登録できないこと' do
        user = FactoryBot.build(:user, password: "123456")
        user.valid?
        expect(user.errors[:password]).to include("Include both letters and numbers")
      end

      it 'passwordが全角では登録できないこと' do
        user = FactoryBot.build(:user, password: "アイウエオ")
        user.valid?
        expect(user.errors[:password]).to include("Include both letters and numbers")
      end
    end
  end
end
