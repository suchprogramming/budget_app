class Category
 attr_reader(:id, :category_name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @category_name = attributes.fetch(:category_name)
  end

  define_method(:==) do |another_category|
    self.id() == another_category.id() && self.category_name() == another_category.category_name()
  end

  define_singleton_method(:all) do
    returned_categories = DB.exec("SELECT * FROM categories;")
    categories = []
    returned_categories.each() do |category_name|
      id = category_name.fetch("id").to_i()
      category_name = category_name.fetch("expense_type")
      categories.push(Category.new({:id => id, :category_name => category_name}))
    end
   categories
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO categories (expense_type) VALUES ('#{@category_name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |search_id|
    Category.all().each() do |category|
      if category.id().==(search_id)
        return category
      end
    end
  end
end
