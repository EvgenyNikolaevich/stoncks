require 'dry/monads'

module Forms
  module Stocks
    class Delete
      include Dry::Monads[:result]

      def self.call(params)
        new.call(params)
      end

      def call(params)
        validate_params(params)
      end

      private

      def validate_params(params)
        id               = Dry.Types::Coercible::Integer[params.dig(:id)]
        validated_params = { id: id }

        Success(validated_params)
      rescue Dry::Types::CoercionError => e
        Failure(e.message)
      end
    end
  end
end