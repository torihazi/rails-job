class SampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "SampleJob performed"
    puts "args: #{args}"
    Rails.logger.info "args: #{args}"
  end
end
