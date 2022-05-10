require 'dry/monads'

module Scenarios
  module Stocks
    class Index
      include Dry::Monads[:result]

      def self.call
        new.call
      end

      def call
        Success(Queries::Stocks.all)
      end
    end
  end
end