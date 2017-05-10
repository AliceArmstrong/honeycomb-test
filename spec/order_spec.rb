require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:advert1) { Advert.new 'WNP/SWCL001/010' }
  let(:advert2) { Advert.new 'ZDW/EOWW005/010' }

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

    it 'can calculate price of multiple orders' do
      order.place_standard_order(advert1, advert2)
      expect(order.total_cost).to eq(20)
    end

    it 'can calculate standard and express orders together' do
      order.place_standard_order(advert1)
      order.place_express_order(advert2)
      expect(order.total_cost).to eq(30)
    end

    # it can calculate 30% discount

    # it can calculate express as $15 when over 2
  end

end
