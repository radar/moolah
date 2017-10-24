require "test_helper"

module Moolah
  class TransactionTest < MiniTest::Test
    def test_initialization
      transaction = Transaction.new(name: "Income", amount: 19.99)
      assert transaction.name == "Income"
      assert transaction.amount == 19.99
    end
  end
end
