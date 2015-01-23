require('spec_helper')

describe(Category) do

  describe(".all") do
    it("will begin with an empty category array") do
      expect(Category.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same expense if it has the same attributes and id") do
      test_category = Category.new({:category_name => "clothes", :id => nil})
      test_category2 = Category.new({:category_name => "clothes", :id => nil})
      expect(test_category).to(eq(test_category2))
    end
  end

  describe("#save") do
    it("saves a category object to the database") do
      test_category = Category.new({:category_name => "clothes", :id => nil})
      test_category.save()
      expect(Category.all).to(eq([test_category]))
    end
  end

  describe(".find") do
      it("will find a specific category by its id") do
      test_category = Category.new({:category_name => "car", :id => nil})
      test_category.save()
      expect(Category.find(test_category.id())).to(eq(test_category))
    end
  end
end
