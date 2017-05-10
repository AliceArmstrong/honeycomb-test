class Order
  attr_accessor :standard, :express

  STANDARD_PRICE = 10
  EXPRESS_PRICE = 20

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
      (@standard.count * STANDARD_PRICE) + (@express.count * EXPRESS_PRICE)
  end

end
