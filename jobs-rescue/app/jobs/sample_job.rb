class SampleJob < ApplicationJob
  queue_as :sample_queue

  def perform(name)
    puts "Hello, #{name}!"
    puts "perform: #{name}"
    puts "class: #{name.class}"
    puts "has superclass: #{name.respond_to?(:superclass)}"
    puts "superclass: #{name.class.superclass}"
    puts "has ancestors: #{name.respond_to?(:ancestors)}"
    puts "ancestors: #{name.class.ancestors}"
    sleep 5
    puts "SampleJob completed"
  end
end