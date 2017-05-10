require 'broadcaster'

describe Broadcaster do
  subject(:broadcaster) { described_class.new("ITV") }

  context 'broadcaster' do

    it 'broadcaster exists' do
      expect(broadcaster.name).to eq("ITV")
    end

  end

end
