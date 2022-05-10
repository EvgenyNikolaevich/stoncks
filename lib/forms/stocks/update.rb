require 'dry/monads'

module Forms
  module Stocks
    class Update
      include Dry::Monads[:result]

      def self.call(params)
        new.call(params)
      end

      def call(params)
        validate_params(params)
      end

      private

      def validate_params(params)
        id               = Dry.Types::Coercible::Integer[params.dig(:data, :id)]
        name             = Dry.Types::Coercible::String[params.dig(:data, :name)]
        validated_params = { id: id, name: name }

        Success(validated_params)
      rescue Dry::Types::CoercionError => e
        Failure(e.message)
      end
    end
  end
end