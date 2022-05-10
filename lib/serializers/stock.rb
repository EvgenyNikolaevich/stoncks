require 'dry/monads'

module Serializers
  class Stock
    include Dry::Monads[:result]

    def self.proceed(stocks)
      new.proceed(stocks)
    end

    def proceed(stocks)
      value = stocks.value_or { |result| result }

      return error_data(value)   if stocks.failure?
      return empty_data           unless value
      return serialize_one(value) unless value.is_a?(Array) 

      serialize_collection(value)
    end

    def serialize_collection(stocks)
      {
        data: stocks.map do |stock|
          {
            id: stock.id,
            name: stock.name,
            bearer_id: stock.bearer_id
          }
        end
      }
    end

    def serialize_one(stocks)
      {
        data: 
          {
            id: stocks.id,
            name: stocks.name,
            bearer_id: stocks.bearer_id
          }
      }
    end

    private
    
    def empty_data
      { data: [] }
    end

    def error_data(value)
      { error: value }
    end
  end
end