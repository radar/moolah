require 'forwardable'

module Moolah
  class Transactions < Array
    alias_method :add, :<<

    def initialize(transactions = [])
      super
      self.replace(transactions)
    end

    def income
      sum { |amount| amount > 0 }
    end

    def expenses
      sum { |amount| amount < 0 }
    end

    def between(start, finish)
      self.class.new(select do |transaction|
        (start..finish).include?(transaction.date)
      end)
    end

    def amount(&condition)
      self.class.new(select { |t| condition[t.amount] })
    end

    private

    def sum(&block)
      map(&:amount).select(&block).sum
    end
  end
end
