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
      filter do |transaction|
        (start..finish).include?(transaction.date)
      end
    end

    def amount(&condition)
      filter { |t| condition[t.amount] }
    end

    def filter(&block)
      self.class.new(select(&block))
    end

    private

    def sum(&block)
      map(&:amount).select(&block).sum
    end
  end
end
