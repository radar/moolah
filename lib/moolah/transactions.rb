module Moolah
  class Transactions
    def initialize
      @transactions = []
    end

    def add(transaction)
      @transactions << transaction
    end

    def income
      @transactions.map(&:amount).select { |amount| amount > 0 }.sum
    end

    def expenses
      @transactions.map(&:amount).select { |amount| amount < 0 }.sum
    end

    def count
      @transactions.count
    end
  end
end
