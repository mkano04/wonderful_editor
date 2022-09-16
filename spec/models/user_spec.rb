require 'rails_helper'

RSpec.describe User, type: :model do
  context "name, uid, email, password を指定しているとき" do
    it "ユーザーを作成する" do
      user = build(:user)
      expect(user).to be_valid
    end
  end

  context "name を指定していないとき" do
    it "ユーザーに失敗する" do
      user = build(:user, name:nil)
      expect(user).to be_invalid
      expect(user.errors.details[:name][0][:error]).to eq :blank
    end
  end

  context "uid を指定していないとき" do
    it "ユーザーに失敗する" do
      user = build(:user, uid:nil)
      expect(user).to be_invalid
      expect(user.errors.details[:uid][0][:error]).to eq :blank
    end
  end

  context "email を指定していないとき" do
    it "ユーザーに失敗する" do
      user = build(:user, email:nil)
      expect(user).to be_invalid
      expect(user.errors.details[:email][0][:error]).to eq :blank
    end
  end

  context "password を指定していないとき" do
    it "ユーザーに失敗する" do
      user = build(:user, password:nil)
      expect(user).to be_invalid
      expect(user.errors.details[:password][0][:error]).to eq :blank
    end
  end

  context "既に同じ name が存在しているとき" do
    it "ユーザーに失敗する" do
      create(:user, name: "aaa")
      user = build(:user, name: "aaa")
      expect(user).to be_invalid
      expect(user.errors.details[:name][0][:error]).to eq :taken
    end
  end

end
