class Advert
    attr_accessor :clock_num, :destination

  def initialize(clock_num, destination)
    @clock_num = clock_num
    @destination = Broadcaster.new(destination)
  end

end
