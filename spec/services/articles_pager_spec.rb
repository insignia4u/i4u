require "spec_helper"

describe ArticlesPager do
  before(:each) do
    @article1 = create(:article)
    @article2 = create(:article)
    @article3 = create(:article)

    @pager    = ArticlesPager.new(Article.all, @article2)
  end

  it "returns the next element in the collection" do
    expect(@pager.next).to eql(@article3)
  end

  it "returns the previous element in the collection" do
    expect(@pager.previous).to eql(@article1)
  end
end
