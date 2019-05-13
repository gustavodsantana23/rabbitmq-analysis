require 'rubygems'
require 'bunny'
require 'benchmark'

puts Benchmark.measure {
  conn = Bunny.new
  conn.start

  ch = conn.create_channel
  exchange = ch.topic('analysis', durable: true)

  exchange.publish('start', routing_key: 'analysis')

  10000.times do
    exchange.publish('ok', routing_key: 'analysis')
  end

  exchange.publish('end', routing_key: 'analysis')

  ch.close
  conn.close
}
