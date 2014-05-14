class Blog::CommentsController < ApplicationController
  def create
    comment = current_article.comments.build(comment_params)
    if comment.save
      redirect_to blog_article_path(current_article),
        success: 'Comment added successfully.'
    else
      redirect_to blog_article_path(current_article),
        error: 'Comment error.'
    end
  end

private
  def current_article
    @article ||= current_site.articles.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :email, :website, :text)
  end
end
