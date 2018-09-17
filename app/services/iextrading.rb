class Iextrading

  def initialize
    @base_uri = "https://api.iextrading.com/1.0/"
  end

  def symbols
    response = RestClient.get(@base_uri + "ref-data/symbols")
    all_symbols = JSON.parse(response.body).map{|element| element['symbol']}
  end

  def batch_chart_request(symbols,last_range)
    unless symbols.nil?
      response = RestClient.get(@base_uri + "stock/market/batch/",
                                {params: {symbols: symbols,
                                          types: 'chart',
                                          range: last_range}})
    end
    all_symbols = JSON.parse(response.body)
  end


end
