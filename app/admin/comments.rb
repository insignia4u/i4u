ActiveAdmin.register Comment, as: "Blog Comment" do
  # t.string   "name"
  # t.string   "email"
  # t.string   "website"
  # t.text     "text"
  # t.integer  "comments_id"
  # t.integer  "article_id"
  # t.datetime "created_at",  :null => false
  # t.datetime "updated_at",  :null => false
  menu parent: "Blog"
  config.comments = false

  index do
    column ("Author"), sortable: :name do |comment|
      comment.name
    end
    column ("Email"), sortable: :email do |comment|
      comment.email
    end
    column ("Website"), sortable: :website do |comment|
      comment.website
    end
    column ("Comment"), sortable: :text do |comment|
      truncate comment.text, length: 100
    end
    column ("Blog article"), sortable: :article do |comment|
      comment.article.title
    end

    default_actions
  end

  controller do
    def resource_params
      return [] if request.get?
      [
        params.require(:comment)
        .permit(:name, :email, :website, :text)
      ]
    end
  end

end