module Scenarios
  module Stocks
    class Create < Base
      def call(params)
        Forms::Stocks::Create.call(params).bind do |data|
         created_stock = Queries::Stocks.create(**data)

         Success(created_stock)
        end
      end
    end
  end
end