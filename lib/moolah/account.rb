require 'forwardable'

module Moolah
  class Account
    extend Forwardable
    delegate [:income, :expenses] => :@transactions

    attr_reader :name, :transactions

    def initialize(name:)
      @name = name
      @transactions = Transactions.new
    end

    def add_transaction(transaction)
      @transactions.add(transaction)
    end
  end
end
