require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '情報が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
    
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmatinが不一致では登録できない' do
        @user.password = 'yuji12345'
        @user.password_confirmation = 'yuji1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'yuji1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角数字のみの場合登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は、半角英数字混合である必要があります')
      end
      it 'passwordが半角英字のみの場合登録できない' do
        @user.password = 'yujimiya'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は、半角英数字混合である必要があります')
      end
      it 'passwordが全角の場合登録できない' do
        @user.password = 'あいうえおかき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は、半角英数字混合である必要があります')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'roleを選択しないと登録できない' do
        @user.role_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Role Please select')
      end

    end
  end
end
