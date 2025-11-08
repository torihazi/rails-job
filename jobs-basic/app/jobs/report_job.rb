class ReportJob < ApplicationJob
  queue_as :default

  def perform(option: {})
    # Do something later
    puts "ReportJob performed"
    puts "option: #{option}"
    puts "option[:user_id]: #{option[:user_id]}"
    puts "option[:message]: #{option[:message]}"
    puts "option[:notification_type]: #{option[:notification_type]}"

    sleep 5
    puts "ReportJob completed"
  end
end
