class Expense

  attr_reader(:id, :purchase_date, :purchase_name, :purchase_amount)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @purchase_date = attributes.fetch(:purchase_date)
    @purchase_name = attributes.fetch(:purchase_name)
    @purchase_amount = attributes.fetch(:purchase_amount)
  end


  define_singleton_method(:all) do
    returned_expenses = DB.exec("SELECT * FROM expenses;")
    expenses = []
    returned_expenses.each() do |expense|
      id = expense.fetch("id").to_i()
      purchase_date = expense.fetch("purchase_date")
      purchase_name = expense.fetch("purchase_name")
      purchase_amount = expense.fetch("purchase_amount")
      expenses.push(Expense.new({:id => id, :purchase_date => purchase_date, :purchase_name => purchase_name, :purchase_amount => purchase_amount}))
    end
    expenses
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO expenses (purchase_date, purchase_amount, purchase_name) VALUES ('#{@purchase_date}',  #{@purchase_amount}, '#{@purchase_name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |search_id|
    Expense.all().each() do |expense|
      if expense.id().==(search_id)
        return expense
      end
    end
  end

  define_method(:==) do |another_expense|
    self.id() == another_expense.id() && self.purchase_name() == another_expense.purchase_name()
  end
end
