class Blog::CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    article = Article.find(params[:article_id])
    comment = Comment.new(comment_params)
    comment.article = article
    if comment.save
      redirect_to blog_article_path(article), success: 'Comment added successfully.'
    else
      redirect_to blog_article_path(article), error: 'Comment error.'
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:name, :email, :website, :text)
    end
end
