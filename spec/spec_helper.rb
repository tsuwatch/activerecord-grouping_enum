require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'activerecord-grouping_enum'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:')

ActiveRecord::Migration.verbose = false
ActiveRecord::Migrator.migrate File.expand_path('../db/migrate', __FILE__), nil

class Post < ActiveRecord::Base
  enum status: { editing: 0, published: 1, deleted: 2 }
end

require 'database_cleaner'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
