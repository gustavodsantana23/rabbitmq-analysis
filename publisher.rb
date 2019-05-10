require 'rubygems'
require 'bunny'

conn = Bunny.new
conn.start

ch = conn.create_channel
exchange = ch.topic('analysis', durable: true)

100.times do
  exchange.publish('ok', routing_key: 'analysis')
end

ch.close
conn.close
