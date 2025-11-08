class ReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "performed at: #{Time.current}"
  end
end
