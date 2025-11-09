require 'resque-retry'

class RetryNonAjJob
  extend Resque::Plugins::Retry
  @queue = :retry_queue

  @retry_limit = 3
  @retry_delay = 10.seconds

  def self.perform()
    id = rand(1..10)
    result = process_data(id: id)
    puts "Data processed successfully with id: #{id}"

  rescue StandardError => e
    puts "Error_puts: #{e.message}, id: #{id}"
    Rails.logger.error "Error: #{e.message}"
    raise e
  end

  def self.process_data(id:)
    if id < 6
      raise StandardError, "Data processing failed"
    else
      { success: true, message: "Data processed successfully" }
    end
  end
end
