require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入登録' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
      it "tokenがあれば保存ができること" do
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号を入力してください')
      end
      it 'postal_codeが「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('郵便番号は「3桁ハイフン4桁」で入力してください')
      end
      it 'prefecture_idが2以上でなければ登録できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('都道府県は---以外で入力してください')
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('市区町村を入力してください')
      end
      it 'addressesが空だと保存できないこと' do
        @order_address.addresses = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('番地を入力してください')
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号を入力してください')
      end
      it 'phone_numberが10桁以上11桁以内の半角数値のみでないと保存できないこと' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10桁以上11桁以内の半角数値のみで入力してください')
      end
      it 'phone_numberが9桁以下だと保存できないこと' do
        @order_address.phone_number = '09011111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10桁以上11桁以内の半角数値のみで入力してください')
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @order_address.phone_number = '090111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('電話番号は10桁以上11桁以内の半角数値のみで入力してください')
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('商品を入力してください')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('ユーザーを入力してください')
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('クレジットカード情報を入力してください')
      end
    end
  end
end