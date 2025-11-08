class UserJob < ApplicationJob
  queue_as :default

  def perform(user:)
    # Do something later
    puts "UserJob performed"
    puts "user: #{user}"
    puts "class: #{user.class}"
    puts "has superclass: #{user.respond_to?(:superclass)}"
    puts "superclass: #{user.class.superclass}" 
    puts "has ancestors: #{user.respond_to?(:ancestors)}"
    puts "ancestors: #{user.class.ancestors}"
    puts "user[:name]: #{user[:name]}"
    puts "user[:email]: #{user[:email]}"

    sleep 5
    puts "UserJob completed"
  end
end
