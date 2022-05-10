require 'dry/monads'

module Forms
  module Stocks
    class Index
      include Dry::Monads[:result]

      def call(params)
        validate_params(params)
      end

      private

      def validate_params(params)
      end
    end
  end
end