require 'spec_helper'

describe Article do
  describe "Attributes accessibility" do
    it { should     respond_to(:author) }
    it { should     respond_to(:title) }
    it { should     respond_to(:subtitle) }
    it { should     respond_to(:content) }
    it { should     respond_to(:summary) }
    it { should     respond_to(:publication_date) }
    it { should     respond_to(:publication_state) }
    it { should     respond_to(:image) }
    it { should     respond_to(:description) }
    it { should     respond_to(:site) }
    it { should     respond_to(:tag_list) }
  end

  describe "Validations" do
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:subtitle) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:publication_date) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:site) }
    it { should validate_presence_of(:tag_list) }
  end

  describe "Factory Definition" do
    it "creates a valid Article" do
      expect{ create(:article) }.to change{Article.count}.by(1)
    end
  end

  describe "Image" do
    before(:each) do
      @article = Article.new
    end

    context "Paperclip behavior" do
      it "respond to image attachment" do
        @article.should respond_to(:image)
      end

      it "have a paperclip filed named image" do
        @article.image.should be_an_instance_of(Paperclip::Attachment)
      end
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

  describe "Tags" do
    before(:each) do
      @article  = create(:article, tag_list: 'Un tag')
      @articles = create_list(:article,4)
      @with_tag = create_list(:article_with_tags,3)
    end

    context "#tag_list" do
      it "returns the article tag" do
        @article.tag_list.first.should eql('Un tag')
      end
    end

    context "#tagged_with" do
      it "return the articles filtred by tags" do
        Article.tagged_with('Tag1').count.should eql(@with_tag.count)
        Article.tagged_with('Tag2').to_a.reverse.should eql(@with_tag)
        Article.tagged_with('Tag3').each do |tag|
          @articles.should_not include(tag)
        end
      end
    end
  end
end

