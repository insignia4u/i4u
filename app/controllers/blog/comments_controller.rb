class Blog::CommentsController < Blog::ArticlesController
  expose(:article){ current_site.articles.published.find(params[:article_id]) }

  def create
    @comment = current_article.comments.build(comment_params)

    if is_comment_valid?(@comment)
      render json: { data: @comment, response: true }

    else
      render json: { response: false, errors: @comment.errors.full_messages }, status: 422
    end
  end

private
  def current_article
    @article ||= current_site.articles.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :email, :website, :text, :comment_id)
  end

  def is_comment_valid?(comment)
    verify_recaptcha(model: comment, message: 'An error has occurred with recaptcha') && comment.save
  end
end
