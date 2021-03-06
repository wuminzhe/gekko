require 'pry'
require 'timecop'
require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
])

SimpleCov.start do
  add_filter '/spec/'
end

require(File.expand_path('../../lib/gekko', __FILE__))

def random_id
  UUID.random_create
end

def populate_book(book, orders)
  orders[:bids].each { |b| book.receive_order(Gekko::LimitOrder.new(:bid, random_id, random_id, b[0], b[1], expiration: b[2])) }
  orders[:asks].each { |b| book.receive_order(Gekko::LimitOrder.new(:ask, random_id, random_id, b[0], b[1], expiration: b[2])) }
end

def populate_book_in_the_past(book, orders)
  Timecop.freeze(Time.at(Time.now.to_i - 3600)) do
    populate_book(book, orders)
  end
end

