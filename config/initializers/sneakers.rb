require 'sneakers'
Sneakers.configure(
  connection: Bunny.new(
    host: ENV['RABBIT_HOST']   || 'localhost',
    port: ENV['RABBIT_PORT']   || 5672,
    user: ENV['RABBIT_USER']   || 'guest',
    pass: ENV['RABBIT_PASS']   || 'guest',
    vhost: ENV['RABBIT_VHOST'] || '/',
  ),
  threads: (ENV['SNEAKERS_POOL_SIZE'] || 1).to_i,
  prefetch: (ENV['SNEAKERS_POOL_SIZE'] || 1).to_i,
  workers: 1
)
Sneakers.logger.level = Logger::INFO