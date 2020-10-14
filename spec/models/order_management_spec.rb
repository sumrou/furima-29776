require 'rails_helper'
describe OrderManagement do
  before do
    @order = FactoryBot.build(:order_management)
  end

  describe '商品購入機能' do
    context '購入がうまくいくとき' do
      it 'ユーザーログインしていてクレジットカード情報と発送のための情報が全て入っていれば出品できる' do
        expect(@order).to be_valid
      end

      it '建物名が空欄でも購入ができること' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'クレジットカード情報が入力されていないと購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Tokenを入力してください')
      end

      it '郵便番号が入力されていないと購入できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal codeは上3ケタ-下4ケタで入力してください')
      end
      it '郵便番号が正しいケタで入力されていないと購入できない' do
        @order.postal_code = '1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal codeは上3ケタ-下4ケタで入力してください')
      end
      it '発送の県が選ばれていないと購入できない' do
        @order.shipping_area_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Shipping areaを選択してください')
      end
      it '市区町村が入力されていないと購入できない' do
        @order.municipality = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Municipalityを入力してください')
      end
      it '番地が入力されていないと購入できない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Addressを入力してください')
      end
      it '電話番号が入力されていないと購入できない' do
        @order.telephone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone numberを入力してください')
      end
      it '電話番号が10ケタより少なく入力されていると購入できない' do
        @order.telephone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone numberは正しく入力してください')
      end
      it '電話番号が11ケタより多く入力されていると購入できない' do
        @order.telephone_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone numberは正しく入力してください')
      end
      it '電話番号が数字以外が入力されていると購入できない' do
        @order.telephone_number = 'abcdefghijk'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone numberは正しく入力してください')
      end
    end
  end
end
