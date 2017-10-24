require "test_helper"

module Moolah
  class TransactionsTest < MiniTest::Test
    def test_add
      transactions = Moolah::Transactions.new
      transactions.add(Minitest::Mock.new)
      assert transactions.count == 1
    end

    def test_income
      transactions = Moolah::Transactions.new
      transaction = Minitest::Mock.new
      def transaction.amount; 10; end
      transactions.add(transaction)
      assert transactions.income == 10
    end

    def test_expenses
      transactions = Moolah::Transactions.new
      transaction = Minitest::Mock.new
      def transaction.amount; -10; end
      transactions.add(transaction)
      assert transactions.expenses == -10
    end
  end
end
