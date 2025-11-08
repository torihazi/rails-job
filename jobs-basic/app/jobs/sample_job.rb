class SampleJob < ApplicationJob
  queue_as :sample

  def perform(*args)
    # Do something later
    puts "SampleJob performed"
    puts "args: #{args}"
  end
end
