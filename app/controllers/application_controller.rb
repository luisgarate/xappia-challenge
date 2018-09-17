class ApplicationController < ActionController::Base
  def index
    iex = Iextrading.new
    # @iex = iex.symbols
    @iex = iex.batch_chart_request("AAPL","1m")
  end

  
end
