BUNNY_POOL = ConnectionPool.new(size: ENV['BUNNY_POOL_SIZE']) do
  Bunny.new.start

  BUNNY_POOL.with do |conn|
    ch = conn.create_channel

    x = ch.topic('analysis', durable: true)
    queue = ch.queue('analysis', durable: true)
    queue.bind(x, routing_key: 'analysis')
  end
end
