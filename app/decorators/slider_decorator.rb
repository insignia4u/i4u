class SliderDecorator < Draper::Decorator
  def initialize(item)
    @item  = item
    @image = @item.image
  end

  def to_hash
    {
      image: {
        normal:  @image.url(:normal),
        medium:  @image.url(:medium),
        small:   @image.url(:small)
      },
      name:  @item.name,
      text:  @item.body
    }
  end
end
