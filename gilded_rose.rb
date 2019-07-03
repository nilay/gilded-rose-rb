class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      item.sell_in -= 1
      if item.name == 'Sulfuras, Hand of Ragnaros'
        item.sell_in += 1
        # exceptional case.
        next
      elsif item.name == 'Aged Brie'
        item.quality = item.sell_in < 0 ? item.quality + 2 : item.quality + 1
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        item.quality = item.sell_in < 0 ? 0 : item.sell_in < 5 ? item.quality + 3 : item.sell_in < 10 ? item.quality + 2 : item.quality + 1
      elsif item.name.include? 'Conjured'
        item.quality = item.sell_in < 0 ? item.quality - 4 : item.quality - 2
      else
        item.quality = item.sell_in < 0 ? item.quality - 2 : item.quality - 1
      end

      item.quality = item.quality < 0 ? 0 : item.quality > 50 ? 50 : item.quality
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
