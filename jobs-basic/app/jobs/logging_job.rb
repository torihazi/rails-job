class LoggingJob < ApplicationJob
  queue_as :default

  before_perform do |job|
    @start_time = Time.current
    puts "before_perform: #{@start_time}"
  end

  after_perform do |job|
    @end_time = Time.current
    puts "after_perform: #{@end_time}"
    puts "duration: #{@end_time - @start_time}"
  end

  def perform(*args)
    puts "perform: #{args}"
    sleep 5
    puts "perform completed"
  end
end
