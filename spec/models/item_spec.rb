require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録できるとき' do
      it 'item_nameとproduct、image、category_id、sales_status_id、shopping_fee_id、prefecture_id、scheduled_delivery_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品登録できないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it 'productが空では登録できない' do
        @item.product = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品画像を入力してください')
      end
      it 'category_idが2以上でなければ登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーは---以外で入力してください')
      end
      it 'sales_status_idが2以上でなければ登録できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態は---以外で入力してください')
      end
      it 'shopping_fee_idが2以上でなければ登録できない' do
        @item.shopping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担は---以外で入力してください')
      end
      it 'prefecture_idが2以上でなければ登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域は---以外で入力してください')
      end
      it 'scheduled_delivery_idが2以上でなければ登録できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数は---以外で入力してください')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'item_nameが40文字以上では登録できない' do
        @item.item_name = 'A' * 41
        @item.valid?      
        expect(@item.errors.full_messages).to include('商品名は40文字以内で入力してください')
      end
      it 'productが1000文字以上では登録できない' do
        @item.product = Faker::Commerce.product_name * 200
        @item.valid?      
        expect(@item.errors.full_messages).to include('商品の説明は1000文字以内で入力してください')
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'priceが￥300より少ない時は登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'priceが￥9999999より多い時は登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
