module Moolah
  class Account
    attr_reader :name, :transactions

    def initialize(name:)
      @name = name
      @transactions = []
    end

    def add_transaction(transaction)
      @transactions << transaction
    end

    def income
      @transactions.map(&:amount).select { |amount| amount > 0 }.sum
    end

    def expenses
      @transactions.map(&:amount).select { |amount| amount < 0 }.sum
    end
  end
end
