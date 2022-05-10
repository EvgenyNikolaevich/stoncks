require 'dry/monads'

module Scenarios
  module Stocks
    class Create
      include Dry::Monads[:result]

      def self.call(params)
        new.call(params)
      end

      def call(params)
        Forms::Stocks::Create.call(params).bind do |data|
         created_stock = Queries::Stocks.create(**data)

         Success(created_stock)
        end
      end
    end
  end
end