require("rspec")
require("pg")
require("expenses")
require("categories")

DB = PG.connect({:dbname => "finance_organizer_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM expenses *;")
    DB.exec("DELETE FROM categories *;")
  end
end
