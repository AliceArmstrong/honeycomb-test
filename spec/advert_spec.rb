require 'advert'

describe Advert do
  subject(:advert) { described_class.new("WNP/SWCL001/010", "ITV") }

  context 'advert' do

    it 'advert exists' do
      expect(advert.clock_num).to eq("WNP/SWCL001/010")
      expect(advert.destination.name).to eq("ITV")
    end

  end

end
