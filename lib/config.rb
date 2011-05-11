require "benchmark"
require "rubygems"
require "bundler"

Bundler.setup

class Conf

  def db_name
    "bench_mongomapper"
  end

  def connection
    @connection ||= Mongo::Connection.new
  end

  def db
    @db ||= connection.db(db_name)
  end

  def clean
    db.collections.each{|c| c.remove}
  end

  def times
    if block_given?
      1000.times{|i| yield i }
    else
      1000
    end
  end
end