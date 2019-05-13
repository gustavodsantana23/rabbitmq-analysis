class MessageReaderService
  def self.process(delivery_info, message)
    if message == 'start' or message == 'end'
      puts message, DateTime.now
    end
  end
end
