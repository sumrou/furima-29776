require 'rails_helper'
describe User do
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'ニックネームとアドレスとパスワードと確認と名前と名前カナと生年月日全部入れてれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ英数字を組み合わせていれば登録できる' do
        @user.password = 'abx000'
        @user.password_confirmation = 'abx000'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'emailの@がないと登録できない' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = Faker::Internet.password(min_length: 5, max_length: 5)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが英字だけの場合は登録できない' do
        @user.password = 'abcefg'
        @user.password_confirmation = 'abcefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'passwordが数字だけの場合は登録できない' do
        @user.password = '123000'
        @user.password_confirmation = '123000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'first_name_kanjiが空欄だと登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字を入力してください')
      end
      it 'last_name_kanjiが空欄だと登録できない' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end
      it 'first_name_kanaが空欄だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(カナ)を入力してください')
      end
      it 'last_name_kanaが空欄だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)を入力してください')
      end
      it 'first_name_kanjiは全角文字でないと登録できない' do
        @user.first_name_kanji = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字には全角文字を使用してください')
      end
      it 'last_name_kanjiは全角文字でないと登録できない' do
        @user.last_name_kanji = 'iiii'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前には全角文字を使用してください')
      end
      it 'first_name_kanaはカタカナでないと登録できない' do
        @user.first_name_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(カナ)はカタカナで入力して下さい')
      end
      it 'last_name_kanaはカタカナでないと登録できない' do
        @user.last_name_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)はカタカナで入力して下さい')
      end
      it 'birthdayが入力されていないと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
