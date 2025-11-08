class NotificationJob < ApplicationJob
  queue_as :default

  def perform(user_id:, message:, notification_type:)
    # Do something later
    puts "NotificationJob performed"
    puts "user_id: #{user_id}"
    puts "message: #{message}"
    puts "notification_type: #{notification_type}"

    sleep 5
    puts "NotificationJob completed"
  end
end
