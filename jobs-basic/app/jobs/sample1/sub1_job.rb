class Sample1::Sub1Job < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end
end
