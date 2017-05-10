require 'advert'

describe Advert do
  # subject(:broadcaster) { described_class }
  subject(:advert) { described_class.new("WNP/SWCL001/010") }

  context 'advert' do

    it 'advert exists' do
      # broadcaster = Broadcaster("Sky")
      expect(advert.clock_num).to eq("WNP/SWCL001/010")
    end

  end

end
