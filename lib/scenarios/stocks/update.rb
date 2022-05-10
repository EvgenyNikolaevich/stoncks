module Scenarios
  module Stocks
    class Update < Base
      def call(params)
        Forms::Stocks::Update.call(params).bind do |data|
          stock         = Queries::Stocks.get_by(id: data[:id])
          updated_stock = Queries::Stocks.update(stock, data: data)

          Success(updated_stock)
        end
      end
    end
  end
end