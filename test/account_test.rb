require "test_helper"

module Moolah
  class AccountTest < MiniTest::Test
    def test_initialization
      account = Account.new(name: "Savings")
      assert account.name == "Savings"
    end

    def test_transactions
      account = Account.new(name: "Savings")
      assert account.transactions.count == 0
    end

    def test_adding_a_transaction
      account = Account.new(name: "Savings")
      account.add_transaction(Minitest::Mock.new)
      assert account.transactions.count == 1
    end

    def test_income
      account = Account.new(name: "Savings")
      transaction = Minitest::Mock.new
      def transaction.amount; 10; end
      account.add_transaction(transaction)
      assert account.income == 10
    end

    def test_expenses
      account = Account.new(name: "Savings")
      transaction = Minitest::Mock.new
      def transaction.amount; -10; end
      account.add_transaction(transaction)
      assert account.expenses == -10
    end
  end
end
