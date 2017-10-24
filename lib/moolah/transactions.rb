require 'forwardable'

module Moolah
  class Transactions
    extend Forwardable

    delegate [:<<, :count] => :@transactions
    alias_method :add, :<<

    def initialize
      @transactions = []
    end

    def income
      sum { |amount| amount > 0 }
    end

    def expenses
      sum { |amount| amount < 0 }
    end

    private

    def sum(&block)
      amounts.select(&block).sum
    end

    def amounts
      @transactions.map(&:amount)
    end
  end
end
