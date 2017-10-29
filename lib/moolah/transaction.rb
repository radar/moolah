module Moolah
  class Transaction
    attr_reader :name, :date, :amount, :tags
    def initialize(name:, date:, amount:, tags: [])
      @name = name
      @date = date
      @amount = amount
      @tags = tags
    end
  end
end
