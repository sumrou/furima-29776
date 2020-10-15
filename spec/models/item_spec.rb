require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it '商品名と画像と商品説明とカテゴリーと状態と配送料負担と発送元地域と発送までの日数と価格が正しく全て入力できていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'ユーザーがログインしていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end

      it '商品画像が添付されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Imageを入力してください')
      end
      it '商品名が記載されていないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Nameを入力してください')
      end
      it 'カテゴリーが選ばれていないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Categoryを選択してください')
      end
      it '商品の状態が選ばれていないと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Conditionを選択してください')
      end
      it '配送料の負担が選ばれていないと出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping chargeを選択してください')
      end
      it '発送元の地域が選ばれていないと出品できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping areaを選択してください')
      end
      it '発送までの日数が選ばれていないと出品できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to shipを選択してください')
      end
      it '価格が空欄だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceは300~9,999,999の間で入力してください')
      end
      it '価格が半角数字でないと入力できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceは半角数字で入力してください')
      end
      it '価格が300円未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceは300~9,999,999の間で入力してください')
      end
      it '価格が10,000,000円以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Priceは300~9,999,999の間で入力してください')
      end
    end
  end
end
