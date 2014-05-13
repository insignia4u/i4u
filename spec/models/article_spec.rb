require 'spec_helper'

describe Article do
  describe "Validations" do
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:subtitle) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:publication_date) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:site) }
  end

  describe "Factory Definition" do
    it "creates a valid Article" do
      expect{ create(:article) }.to change{Article.count}.by(1)
    end
  end

  describe "#most_recents" do
    before(:each) do
      @article  = create(:article)
      @most_recents = create_list(:published_article,3)
    end

    context "Returns the most recents articles" do
      it "returns 3 articles " do
        Article.most_recents.count.should eql(3)
      end
      it "returns the most recents" do
        Article.most_recents.to_a.should eql(@most_recents.reverse)
      end
      it "doens't includes old articles" do
        Article.most_recents.should_not include(@article)
      end
    end
  end

  describe "Article position" do
    before(:each) do
      @all = create_list(:published_article, 3)
    end

    it { Article.next_article(@all.first).should eql(@all.second) }
    it { Article.next_article(@all.last).should be_false }
    it { Article.prev_article(@all.second).should eql(@all.first) }
    it { Article.prev_article(@all.first).should be_false }
  end
end

