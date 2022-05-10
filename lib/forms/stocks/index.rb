module Forms
  module Stocks
    class Index < Base
      def call(params)
        validate_params(params)
      end

      private

      def validate_params(params)
      end
    end
  end
end