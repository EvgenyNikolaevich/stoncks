module Forms
  module Stocks
    class Delete < Base
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