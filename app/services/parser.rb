class Parser

  def initialize(data)
    @data = data
  end

  def parse
    @parsed_data = {}
    @data.each do |symbol, data|
      new_data = {}
      data['chart'].map{|element| new_data[element['date']] = element['volume']  }
      @parsed_data[symbol] = new_data
    end
    @parsed_data
  end

end
