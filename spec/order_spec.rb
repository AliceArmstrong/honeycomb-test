require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:advert1) { Advert.new 'WNP/SWCL001/010', 'ITV' }
  let(:advert2) { Advert.new 'ZDW/EOWW005/010', 'Disney' }

  context 'order' do

    it 'standard exists' do
      expect(order.standard).to eq([])
    end

    it 'express exists' do
      expect(order.express).to eq([])
    end

    it 'can calculate price of single order' do
      order.place_standard_order(advert1)
      expect(order.total_cost).to eq(10)
    end

    it 'can calculate multiple orders and apply 10% discount on orders over $30' do
      multiple_order
      expect(order.total_cost).to eq(36)
    end

    it 'can calculate express as $15 when over two express orders' do
      express_order
      expect(order.total_cost).to eq(40.5)
    end

    # it 'can show the order invoice' do
    #   multiple_order
    #   expect(order.order_invoice.to_s).to include("ZDW/EOWW005/010")
    #   expect(order.order_invoice.to_s).to include("Disney")
    #   expect(order.order_invoice.to_s).to include("Total cost: 36")
    # end

  end

end

def multiple_order
  order.place_standard_order(advert1, advert2)
  order.place_express_order(advert2)
end

def express_order
  order.place_express_order(advert1, advert2, advert1)
end
