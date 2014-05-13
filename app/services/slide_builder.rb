class SlideBuilder
  def initialize(content)
    @content = content
  end

  def slideshow
    @content.map { |element| SliderDecorator.new(element).to_hash }
  end
end
