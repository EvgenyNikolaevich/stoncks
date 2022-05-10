module Queries
  class Stocks
    class << self
      def all
        ::Stock.not_deleted.to_a
      end

      def get_by(id:)
        ::Stock.find(id)
      end

      def update(stock, data:)
        stock.update(data)
        stock
      end

      def soft_delete_by(id:)
        stock = ::Stock.find_by(id)
        stock.update(deleted_at: Time.now)
        stock
      end

      def create(name:, bearer_id:)
        bearer = ::Bearer.find_or_create_by(id: bearer_id)
        ::Stock.find_or_create_by!(name: name, bearer_id: bearer.id)
      end
    end
  end
end