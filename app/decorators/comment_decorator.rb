class CommentDecorator
  def initialize(comment)
    @comment = comment
  end

  def to_hash
    @comment.attributes.merge(new_values)
  end

  protected

  def new_values
    {
      date: I18n.l(@comment.created_at, format: :comment)
    }
  end
end