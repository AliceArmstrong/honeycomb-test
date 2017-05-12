require_relative 'advert'

class Order
  attr_accessor :standard, :express

  STANDARD_PRICE = 10
  EXPRESS_PRICE = 20
  DISC_EXPRESS_PRICE = 15
  EXPRESS_DISCOUNT_COUNT = 2
  DISCOUNT_THRESHOLD = 30
  DISCOUNT_PERCENTAGE = 0.9

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
    express_discount
  end

  def order_invoice
    standard_memo
    express_memo
    p "Total cost: #{total_cost}"
  end

  def standard_memo
    p "STANDARD:"
    @standard.each { |item|
      p "Advert ID: " + item.clock_num.to_s
      p "Broadcaster destination: " + item.destination.name.to_s
      p "---"
    }
  end

  def express_memo
    p "EXPRESS:"
    @express.each { |item|
      p "Advert ID: " + item.clock_num.to_s
      p "Broadcaster destination: " + item.destination.name.to_s
      p "---"
    }
  end

  def express_discount
    if @express.count >= EXPRESS_DISCOUNT_COUNT
      cost = (@standard.count * STANDARD_PRICE) + (@express.count * DISC_EXPRESS_PRICE)
    else
      cost = (@standard.count * STANDARD_PRICE) + (@express.count * EXPRESS_PRICE)
    end
    percentage_discount(cost)
  end

  def percentage_discount(cost)
    if cost > DISCOUNT_THRESHOLD
      cost = cost * DISCOUNT_PERCENTAGE
    else
      cost
    end
  end

end
