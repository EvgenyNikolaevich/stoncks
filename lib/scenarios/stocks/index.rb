module Scenarios
  module Stocks
    class Index < Base
      def self.call
        new.call
      end

      def call
        Success(Queries::Stocks.all)
      end
    end
  end
end