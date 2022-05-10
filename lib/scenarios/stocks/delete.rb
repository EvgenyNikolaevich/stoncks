module Scenarios
  module Stocks
    class Delete < Base
      def call(params)
        Forms::Stocks::Delete.call(params).bind do |id|
          deleted_stock = Queries::Stocks.soft_delete_by(id: id)

          Success(deleted_stock)
        end
      end
    end
  end
end