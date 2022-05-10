module Services
  class UpdateStock
    def self.call(**params)
      new.call(**params)
    end

    def call(stock, data: data)
      stock.update(data)
    end
  end
end