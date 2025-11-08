class RetryJob < ApplicationJob
  queue_as :default

  def perform(id:)
    result = process_data(id: id)
    if result[:success] == false
      raise StandardError, "Data processing failed"
    end
    puts "Data processed successfully with id: #{id}"

  rescue StandardError => e
    puts "Error_puts: #{e.message}"
    Rails.logger.error "Error: #{e.message}"
    raise e
  end

  def process_data(id:)
    if id.even?
      { success: true, message: "Data processed successfully" }
    else
      { success: false, message: "Data processing failed" }
    end
  end
end
