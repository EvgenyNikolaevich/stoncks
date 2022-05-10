module Forms
  module Stocks
    class Create < Base
      def call(params)
        validate_params(params)
      end

      private

      def validate_params(params)
        bearer_id        = Dry.Types::Coercible::Integer[params.dig(:data, :bearer_id)]
        name             = Dry.Types::Coercible::String[params.dig(:data, :name)]
        validated_params = { bearer_id: bearer_id, name: name }

        Success(validated_params)
      rescue Dry::Types::CoercionError => e
        Failure(e.message)
      end
    end
  end
end