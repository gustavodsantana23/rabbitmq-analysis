class MessageReaderWorker
  include Sneakers::Worker

  from_queue 'analysis', durable: true, ack: true, exchange_type: :topic
  def work_with_params(message, delivery_info, metadata)
    MessageReaderService.process(delivery_info, message)
    ack!
  end
end
