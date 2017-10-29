require "test_helper"
require "date"

module Moolah
  class TransactionTest < MiniTest::Test
    def test_initialization
      transaction = Transaction.new(
        name: "Income",
        date: Date.today,
        amount: 19.99,
        tags: ["income"]
      )
      assert transaction.name == "Income"
      assert transaction.date == Date.today
      assert transaction.amount == 19.99
      assert transaction.tags == ["income"]
    end
  end
end
