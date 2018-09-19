class ApplicationController < ActionController::Base
  before_action :set_api, :set_symbols

  def index
  end


  def search
    range = params[:range].present? ? "1y" : "1m"
    symbols = params[:search].join(',')
    data = @iex.batch_chart_request(symbols, range)
    @charts_data = Parser.new(data).parse
  end

  private

  def set_api
    @iex = Iextrading.new
  end

  def set_symbols
    @symbols = @iex.symbols
  end
end
