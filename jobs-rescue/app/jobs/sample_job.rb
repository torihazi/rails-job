class SampleJob
  @queue = :sample_queue

  def self.perform(name)
    puts "Hello, #{name}!"
  end
end