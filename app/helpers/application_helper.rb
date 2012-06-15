module ApplicationHelper
  def first_project(collection, resource)
    resource == collection.first ? 'first' : ''
  end
end
