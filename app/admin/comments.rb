ActiveAdmin.register Comment, as: "Blog Comment" do
  menu parent: "Blog"
  config.comments = false
  actions :all, :except => [:new]

  permit_params :name, :email, :website, :text

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

    actions
  end

  form do |f|
    f.inputs "Edit Comment" do
      f.input :name
      f.input :email
      f.input :website
      f.input :text
    end

    actions
  end

end
