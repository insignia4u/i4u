class ArticlesPager
  attr_reader :previous, :next

  def initialize(articles, current_article)
    @collection = articles
    @current    = current_article
    @previous   = nil
    @next       = nil

    get_previous_and_next_elements
  end

protected
  def get_previous_and_next_elements
    found = false
    @collection.each do |item|
      if @current == item
        found = true
      else
        if found
          @next = item
          break
        else
          @previous = item
        end
      end
    end
  end
end
