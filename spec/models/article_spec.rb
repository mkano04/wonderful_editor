require 'rails_helper'

RSpec.describe Article, type: :model do

  before do
    User.create!(id: 1, name: "testname", email: "test@exeample.com", uid: "testID", password:"testpass")
  end

  context "title,body が存在するとき" do
    it "記事を作成する" do
      article = Article.new(title: "testtitle",body: "testbody", user_id:1 )
      expect(article).to be_valid
    end
  end

  context "title が存在しないとき" do
    it "記事の作成に失敗する" do
      article = Article.new(title: nil ,body: "testbody", user_id:1 )
      expect(article).to be_invalid
      expect(article.errors.details[:title][0][:error]).to eq :blank
    end
  end

  context "body が存在しないとき" do
    it "記事の作成に失敗する" do
      article = Article.new(title: "testtitle",body: nil, user_id:1 )
      expect(article).to be_invalid
      expect(article.errors.details[:body][0][:error]).to eq :blank
    end
  end
end
