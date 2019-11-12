require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a name, email, password" do
      user = build(:user)
      expect(user).to be_valid
    end

    # nameが空では登録できないこと
    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  # emailに正確ではない
    it "is invalid if email is already invalid" do
      user = build(:user, email:"abc")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end


    # emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # passwordとpassword_confirmationが別であると登録できないこと
    it "is invalid if password and password_confirmation are not same" do
      user = build(:user, password: "aaaaaaaa", password_confirmation: "bbbbbbbb")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    
    # passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "",)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end


    # nameが20文字以下では登録できること
    it "is valid with a name that has less than 20 characters " do
      user = build(:user, name: "aaaaaaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end

    it "is invalid without a name that has more than 21 characters" do
      user = build(:user, name: "123456789012345678901")
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 20 characters)")
    end

    # 重複したemailが存在すること
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    # passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end