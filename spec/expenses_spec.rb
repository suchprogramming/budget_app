require('spec_helper')

describe(Expense) do

  describe(".all") do
    it("will begin with an empty expense array") do
      expect(Expense.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an expense object to the database") do
      test_expense = Expense.new({:purchase_date => "2015-06-15", :purchase_name => "Groceries", :purchase_amount => 20.50, :id => nil})
      test_expense.save()
      expect(Expense.all()).to(eq([test_expense]))
    end
  end

  describe("#==") do
    it("is the same expense if it has the same attributes and id") do
      test_expense = Expense.new({:purchase_date => "2015-06-15", :purchase_name => "Groceries", :purchase_amount => 20.50, :id => nil})
      test_expense2 = Expense.new({:purchase_date => "2015-06-15", :purchase_name => "Groceries", :purchase_amount => 20.50, :id => nil})
      expect(test_expense).to(eq(test_expense2))
    end
  end

  describe(".find") do
    it("returns an expense object given an id") do
      expense = Expense.new({ :purchase_name => "coffee", :purchase_amount => 4.50, :purchase_date => "2015-01-22", :id => nil})
      expense.save()
      expect(Expense.find(expense.id())).to(eq(expense))
    end
  end
end
