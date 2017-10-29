require "test_helper"
require "date"

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

    def add_common_transactions(transactions)
      transaction = Moolah::Transaction.new(
        name: "One",
        date: Date.today,
        amount: 1
      )
      transaction_2 = Moolah::Transaction.new(
        name: "Two",
        date: Date.today + 1,
        amount: 10
      )
      transaction_3 = Moolah::Transaction.new(
        name: "Three",
        date: Date.today - 1,
        amount: 100
      )
      transactions.add(transaction)
      transactions.add(transaction_2)
      transactions.add(transaction_3)
    end

    def test_between
      transactions = Moolah::Transactions.new
      add_common_transactions(transactions)

      matching = transactions.between(Date.today, Date.today + 1)
      assert matching.count == 2

      assert_equal matching.map(&:name), ["One", "Two"]
    end

    def test_amount
      transactions = Moolah::Transactions.new
      add_common_transactions(transactions)

      matching = transactions.amount { |a| a >= 10 }
      assert matching.count == 2

      assert_equal matching.map(&:name), ["Two", "Three"]
    end

    def test_chaining
      transactions = Moolah::Transactions.new
      add_common_transactions(transactions)

      matching = transactions
        .amount { |a| a >= 10 }
        .between(Date.today, Date.today + 1)

      assert matching.count == 1

      assert_equal matching.first.name, "Two"
    end
  end
end
