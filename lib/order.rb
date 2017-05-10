require_relative 'advert'

class Order
  attr_accessor :standard, :express

  STANDARD_PRICE = 10
  EXPRESS_PRICE = 20
  DISC_EXPRESS_PRICE = 15

  def initialize
    @standard = []
    @express = []
  end

  def place_standard_order(*clock_num)
    clock_num.each { |order|
      @standard << order
    }
  end

  def place_express_order(*clock_num)
    clock_num.each { |order|
      @express << order
    }
  end

  def total_cost
    if @express.count >= 2
      cost = (@standard.count * STANDARD_PRICE) + (@express.count * DISC_EXPRESS_PRICE)
    else
      cost = (@standard.count * STANDARD_PRICE) + (@express.count * EXPRESS_PRICE)
    end
    if cost > 30
      cost = cost * 0.9
    else
      cost
    end
  end

end
