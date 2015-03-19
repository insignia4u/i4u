class Blog::CommentsController < ApplicationController
  before_filter :antispam!, only: [:create]

  def create
    comment = current_article.comments.build(comment_params)
    if comment.save
      redirect_to blog_article_path(current_article),
        success: 'Comment added successfully.'
    else
      redirect_to blog_article_path(current_article)
      flash[:error] = "Comment can't be published: #{comment.errors.full_messages.join(', ')}"
    end
  end

private
  def current_article
    @article ||= current_site.articles.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :email, :website, :text, :comment_id)
  end
end
