module ApplicationHelper
  def first_resource(collection, resource)
    resource == collection.first ? 'first' : ''
  end

  def last_resource(collection, resource)
    resource == collection.last ? 'last' : ''
  end
end
